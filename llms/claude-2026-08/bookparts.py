"""The pieces publish.sh and make-downloads.sh both need: how a source file is
split from its title, what comes out before a reader sees it, and the order of
the book. Shared so the website and the download files can't drift apart."""

import re

SITE_URL = 'https://www.nomorecontempt.org'
TITLE = 'No More Contempt'
AUTHOR = 'Aditya Prasad'

# Reading order, the same order the site's menu follows.
FRONT = ['start-here.md']
BOOK_FILES = ['preface.md', 'chapter-1.md', 'chapter-1a.md', 'chapter-2.md',
              'chapter-3.md', 'chapter-4.md', 'chapter-5.md']
DRAFT_FILES = [f'chapter-{n}.md' for n in range(6, 18)]
APPENDIX_FILES = ['appendix-1-recursion.md', 'appendix-2-what-others-have-seen.md',
                  'appendix-3-the-traditions.md']
CONDENSED = ['condensed.md']
MAP = ['rest-of-book.md']
READING_ORDER = FRONT + BOOK_FILES + DRAFT_FILES + APPENDIX_FILES + CONDENSED + MAP

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
TODO_RE = re.compile(r'\s?\[TODO(?:\([^)]*\))?:[^\]]*\]|<!--\s*TODO.*?-->', re.S)


def strip_todos(text):
    text = text.split('<!-- working notes -->')[0]
    text = re.split(r'\n## Original material\b', text)[0]
    return TODO_RE.sub('', text).rstrip() + '\n'


# The draft chapters carry their disclosure as a red HTML paragraph, which every
# output but the website would drop on the floor. Plain italics survive anywhere.
BANNER_RE = re.compile(r'^<p [^>]*>\s*<em>(.*?)</em>\s*</p>\s*', re.S)


def banner_to_markdown(text):
    return BANNER_RE.sub(lambda m: '*' + ' '.join(m.group(1).split()) + '*\n\n', text)


WORDS_PER_PAGE = 280


def pages(words):
    return int(round(words / float(WORDS_PER_PAGE)))


def start_here_counts(body, book_words, map_words):
    """Start here quotes its own lengths; keep them true wherever it's published."""
    body = body.replace('It runs about fifty pages.',
                        f'It runs about {pages(book_words)} pages.')
    return body.replace(
        '**The map**, called *Where This Goes*, is the rest of the book in outline:',
        '**The map**, called *Where This Goes*, is the rest of the book in outline, '
        f'about {pages(map_words)} pages:')
