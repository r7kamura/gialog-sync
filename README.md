# gialog-sync

Custom action to update Markdown files for [gialog](https://github.com/r7kamura/gialog).

## Usage

This action reponds to these events and partially update data files.

```yaml
on:
  issue_comment:
    types:
      - created
      - deleted
      - edited
  issues:
    types:
      - closed
      - deleted
      - edited
      - labeled
      - opened
      - pinned
      - reopened
      - transferred
      - unlabeled
      - unpinned

jobs:
  sync:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v3
      - uses: actions/checkout@v3
        with:
          path: data
          ref: data
        continue-on-error: true
      - uses: r7kamura/gialog-sync@v0
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      - uses: peaceiris/actions-gh-pages@v3
        with:
          destination_dir: .
          disable_nojekyll: true
          force_orphan: true
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_branch: data
          publish_dir: data
```

## File structure

```
.
`- issues/
   |- 1/
   |  `- issue.md
   `- 2/
      |- issue.md
      `- issue_comments
         |- 1234567890.md
         `- 1234567891.md
```
