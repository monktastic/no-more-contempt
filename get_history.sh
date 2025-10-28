#!/bin/zsh

git --no-pager log --reverse --format="%H" -- index.md | while read sha; do
    echo "================================"
    echo "COMMIT: $sha"
    echo "DATE: $(git --no-pager show -s --format=%ci $sha)"
    echo "MESSAGE: $(git --no-pager show -s --format=%s $sha)"
    echo "================================"
    echo ""
    git --no-pager show $sha:index.md
    echo ""
    echo ""
done
