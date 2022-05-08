# frozen_string_literal: true

require 'json'
require 'pathname'

module Gialog
  autoload :ConvertMarkdownToHtml, 'gialog/convert_markdown_to_html'
  autoload :Database, 'gialog/database'
  autoload :GetGithubPayload, 'gialog/get_github_payload'
  autoload :IssueCommentDatabase, 'gialog/issue_comment_database'
  autoload :IssueDatabase, 'gialog/issue_database'
  autoload :Sync, 'gialog/sync'
  autoload :UpsertIssue, 'gialog/upsert_issue'
  autoload :UpsertIssueComment, 'gialog/upsert_issue_comment'
end
