#!/bin/sh
# Finds reader comments that no longer have a home. Hypothesis anchors a note to
# the words it was written on; edit those words away and the note becomes an
# orphan, still held at hypothes.is with its quote but no longer shown anywhere
# in the text. Nothing stores that status: it's a verdict reached against the
# page as it is now, so it has to be recomputed, and the build is when the text
# changes. This writes orphans.md at the repo root, which Jekyll turns into the
# Orphaned comments page, with the count in the nav when there are any.
#
# Run it after publish.sh and before jekyll build. Public annotations need no
# credentials; for a private group set HYPOTHESIS_TOKEN and HYPOTHESIS_GROUP.
# ORPHANS_FIXTURE=file.json reads annotations from a file instead of the API,
# which is how this gets tested without waiting for real readers.
cd "$(dirname "$0")" || exit 1

OUT=../..
while [ $# -gt 0 ]; do
  case "$1" in
    --out) OUT="$2"; shift 2 ;;
    --out=*) OUT="${1#--out=}"; shift ;;
    *) printf 'check-orphans.sh: unknown option %s\n' "$1" >&2; exit 1 ;;
  esac
done
OUT=$(cd "$OUT" && pwd) || exit 1

OUT="$OUT" python3 - <<'PY'
import difflib, json, os, pathlib, re, sys, urllib.error, urllib.request
from bookparts import SITE_URL

ROOT = pathlib.Path(os.environ['OUT'])
API = 'https://hypothes.is/api/search'
PAGE_SIZE = 200


def fetch():
    """Every annotation on the site, or None if hypothes.is can't be reached."""
    fixture = os.environ.get('ORPHANS_FIXTURE')
    if fixture:
        return json.loads(pathlib.Path(fixture).read_text())['rows']
    token, group = os.environ.get('HYPOTHESIS_TOKEN'), os.environ.get('HYPOTHESIS_GROUP')
    rows, offset = [], 0
    while True:
        url = f'{API}?wildcard_uri={SITE_URL}/*&limit={PAGE_SIZE}&offset={offset}'
        if group:
            url += f'&group={group}'
        req = urllib.request.Request(url)
        if token:
            req.add_header('Authorization', f'Bearer {token}')
        try:
            with urllib.request.urlopen(req, timeout=30) as r:
                batch = json.load(r)['rows']
        except (urllib.error.URLError, TimeoutError, OSError) as e:
            print(f'check-orphans.sh: no answer from hypothes.is ({e}); skipping', file=sys.stderr)
            return None
        rows += batch
        if len(batch) < PAGE_SIZE:
            return rows
        offset += len(batch)


# Match the way a reader's quote matches: ignore what markup and smart quotes
# did to the characters, and compare the words.
QUOTES = str.maketrans({'‘': "'", '’': "'", '“': '"', '”': '"',
                        '–': '-', '—': '-', '…': '...'})
def normalize(text):
    text = text.translate(QUOTES)
    text = re.sub(r'\[([^\]]*)\]\([^)]*\)', r'\1', text)   # links keep their words
    text = re.sub(r'[*_`#>]+', '', text)                    # emphasis, headings, code
    return ' '.join(text.split()).lower()


def site_text():
    """Every published page's words, by the URL a reader would annotate."""
    pages = {}
    for path in ROOT.rglob('*.md'):
        if any(part.startswith(('_', '.')) for part in path.relative_to(ROOT).parts):
            continue
        text = path.read_text()
        m = re.search(r'^permalink:\s*(\S+)\s*$', text, re.M)
        if not m:
            continue
        body = text.split('---', 2)[-1]
        title = re.search(r'^title:\s*"?(.*?)"?\s*$', text, re.M)
        pages[m.group(1).rstrip('/') or '/'] = (
            normalize(body), title.group(1) if title else m.group(1))
    return pages


def anchored(quote, haystack):
    """Would the client still find these words? Exactly, or close enough."""
    quote = normalize(quote)
    if not quote:
        return True
    if quote in haystack:
        return True
    # Look only where a seed from either end lands, then judge that neighbourhood.
    seeds = {quote[:24], quote[-24:]}
    spots = [i for s in seeds if len(s) > 8
             for i in (haystack.find(s),) if i != -1]
    for i in spots:
        window = haystack[max(0, i - 10): i + len(quote) + 40]
        # How much of the quote survives, counting every piece that still
        # matches: a typo or a swapped word breaks a run without losing the
        # passage, which is the common case when prose gets edited under a note.
        blocks = difflib.SequenceMatcher(None, quote, window).get_matching_blocks()
        if sum(b.size for b in blocks) >= 0.75 * len(quote):
            return True
    return False


rows = fetch()
pages = site_text()
orphans, checked = [], 0
for a in rows or []:
    uri = re.sub(r'[#?].*$', '', a.get('uri', ''))
    if not uri.startswith(SITE_URL):
        continue
    path = uri[len(SITE_URL):].rstrip('/') or '/'
    quote = next((s.get('exact', '') for t in a.get('target', [])
                  for s in t.get('selector', []) if s.get('type') == 'TextQuoteSelector'), '')
    checked += 1
    if path not in pages:                      # the page itself is gone or renamed
        orphans.append((a, uri, path, quote, 'the page it was on is gone'))
    elif not anchored(quote, pages[path][0]):
        orphans.append((a, uri, path, quote, 'the words it was on have changed'))

if rows is None:
    body = ("The check didn't run: hypothes.is couldn't be reached when this "
            "build was made.\n")
    title = 'Orphaned comments'
elif not checked:
    body = 'No comments on the site yet.\n'
    title = 'Orphaned comments'
elif not orphans:
    body = (f'Nothing orphaned. All {checked} '
            f'{"comment" if checked == 1 else "comments"} still sit on the words '
            'they were written on.\n')
    title = 'Orphaned comments'
else:
    lines = [f'{len(orphans)} of {checked} comments no longer have a home. They are '
             f'still held at hypothes.is, with the passage they were written on, '
             'and can be read here even though nothing on the page shows them.\n']
    for a, uri, path, quote, why in orphans:
        who = (a.get('user') or '').split(':')[-1].split('@')[0]
        name = pages[path][1] if path in pages else path
        lines.append(f'\n## {name}\n')
        lines.append(f'[{uri}]({uri})\n')
        lines.append(f'\n*{who}, {(a.get("created") or "")[:10]} — {why}.*\n')
        if quote:
            lines.append('\n> ' + ' '.join(quote.split()) + '\n')
        if a.get('text'):
            lines.append('\n' + '\n'.join(
                '  ' + l for l in a['text'].strip().split('\n')) + '\n')
        link = (a.get('links') or {}).get('incontext') or a.get('links', {}).get('html', '')
        if link:
            lines.append(f'\n[The note at hypothes.is]({link})\n')
    body = ''.join(lines)
    title = f'⚠ Orphaned comments ({len(orphans)})'

(ROOT / 'orphans.md').write_text(
    f'---\ntitle: "{title}"\nnav_order: 6\npermalink: /orphans/\n---\n\n'
    '<!-- Generated by llms/claude-2026-08/check-orphans.sh. Do not edit. -->\n\n'
    f'# Orphaned comments\n\n{body}')
print(f'orphans: {len(orphans)} of {checked} checked')
if orphans and os.environ.get('GITHUB_ACTIONS'):
    print(f'::warning::{len(orphans)} reader comments are orphaned; see /orphans/')
PY
