# gialog-sync

Custom action to update JSON files for [gialog](https://github.com/r7kamura/gialog).

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
```
