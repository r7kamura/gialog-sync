# frozen_string_literal: true

require 'pathname'

module Gialog
  class DeleteIssueComment
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
      pathname.delete
    end

    private

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
