# frozen_string_literal: true

require 'pathname'
require 'yaml'

module Gialog
  class UpsertIssueComment
    class << self
      # @param [Hash] issue
      # @param [Hash] issue_comment
      def call(
        issue:,
        issue_comment:
      )
        new(
          issue: issue,
          issue_comment: issue_comment
        ).call
      end
    end

    # @param [Hash] issue_comment
    # @param [Hash] issue
    # @param [Hash] issue_comment
    def initialize(
      issue:,
      issue_comment:
    )
      @issue = issue
      @issue_comment = issue_comment
    end

    def call
      file_content = generate_file_content
      pathname.parent.mkpath
      pathname.write(file_content)
    end

    private

    # @return [String]
    def generate_file_content
      body = @issue_comment.delete('body')
      [
        @issue_comment.to_yaml,
        body
      ].join("\n---\n")
    end

    # @return [String]
    def path
      format(
        'data/issues/%<issue_number>s/issue_comments/%<issue_comment_id>s.md',
        issue_comment_id: @issue_comment['id'],
        issue_number: @issue['number']
      )
    end

    # @return [Pathname]
    def pathname
      ::Pathname.new(path)
    end
  end
end
