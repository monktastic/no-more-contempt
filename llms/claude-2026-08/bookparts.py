"""The pieces publish.sh and make-downloads.sh both need: how a source file is
split from its title, what comes out before a reader sees it, and the order of
the book. Shared so the website and the download files can't drift apart."""

import pathlib
import re

SITE_URL = 'https://www.nomorecontempt.org'
TITLE = 'No More Contempt'
AUTHOR = 'Aditya Prasad'

# What the site's menu and the downloads follow: Start here, the November book
# (llms/claude-2026-11/short-book/) and the appendices, which serve every version
# of the book and so live beside the current one.
CURRENT = pathlib.Path(__file__).resolve().parent.parent / 'claude-2026-11'
CURRENT_BOOK = CURRENT / 'short-book'
START_HERE = CURRENT / 'start-here.md'
APPENDIX_DIR = CURRENT / 'appendices'

# The long book's reading order. The site keeps these pages but hides them from
# its menu.
FRONT = []
BOOK_FILES = ['preface.md', 'chapter-1.md', 'chapter-1a.md', 'chapter-2.md',
              'chapter-3.md', 'chapter-4.md', 'chapter-5.md']
DRAFT_FILES = [f'chapter-{n}.md' for n in range(6, 18)]
APPENDIX_FILES = ['appendix-1-recursion.md', 'appendix-2-the-traditions.md',
                  'appendix-3-what-others-have-seen.md']
CONDENSED = ['condensed.md']
MAP = ['rest-of-book.md']
READING_ORDER = FRONT + BOOK_FILES + DRAFT_FILES + APPENDIX_FILES + MAP  # condensed.md is kept but not published

# Titles the source files don't carry themselves.
TITLE_OVERRIDES = {'chapter-3.md': 'Chapter 3: The Sacrifice',
                   'start-here.md': 'Start here',
                   'rest-of-book.md': 'Where This Goes'}


def split_title(text):
    """Returns (title, body) with the first level-1 heading removed from body."""
    lines = text.split('\n')
    for i, l in enumerate(lines):
        if l.startswith('# '):
            return l[2:].strip(), ('\n'.join(lines[:i] + lines[i + 1:])).strip() + '\n'
    return None, text.strip() + '\n'


# Strips [TODO: ...] and [TODO(name): ...], HTML TODO comments, everything after
# the working-notes marker, and the "Original material" section of the draft
# chapters (Aditya's placed passages, kept in the source for recovery only).
TODO_RE = re.compile(r'[ \t]?\[TODO(?:\([^)]*\))?:[^\]]*\]|<!--\s*TODO.*?-->', re.S)


def strip_todos(text):
    text = text.split('<!-- working notes -->')[0]
    text = re.split(r'\n## Original material\b', text)[0]
    text = TODO_RE.sub('', text)
    # Holding pens and any other HTML comment: invisible on the page, but they'd
    # sit in the page source and the downloads, and they'd inflate the counts.
    text = re.sub(r'<!--.*?-->', '', text, flags=re.S)
    # A chapter that ends on a section rule, or on the double bar above its
    # holding area, would end the page on a stray line.
    text = re.sub(r'(\n[ \t]*---[ \t]*)+\s*$', '', text.rstrip())
    return text.rstrip() + '\n'


# The draft chapters carry their disclosure as a red HTML paragraph, which every
# output but the website would drop on the floor. Plain italics survive anywhere.
BANNER_RE = re.compile(r'^<p [^>]*>\s*<em>(.*?)</em>\s*</p>\s*', re.S)


def banner_to_markdown(text):
    return BANNER_RE.sub(lambda m: '*' + ' '.join(m.group(1).split()) + '*\n\n', text)


WORDS_PER_PAGE = 280


def pages(words):
    return int(round(words / float(WORDS_PER_PAGE)))


def condensed_files(here=None):
    """The current book's sources in reading order: its preface, then its
    chapters. A letter after a number sorts after it, so 6a follows 6. The
    argument is ignored; it's kept so old callers still work."""
    return [CURRENT_BOOK / 'preface.md'] + sorted(CURRENT_BOOK.glob('chapter-*.md'))


def start_here_counts(body, condensed_words):
    """Start here quotes the condensed book's length; keep it true wherever it's published."""
    return body.replace('It runs about seventy pages.',
                        f'It runs about {pages(condensed_words)} pages.')
