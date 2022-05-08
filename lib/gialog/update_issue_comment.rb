# frozen_string_literal: true

module Gialog
  class UpdateIssueComment
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
      data = IssueCommentsDatabase.read

      data['issue_comments'] ||= {}
      data['issue_comments'][issue_number_string] ||= {}
      data['issue_comments'][issue_number_string][issue_comment_id_string] = @issue_comment.merge(
        'bodyHTML' => ConvertMarkdownToHtml.call(@issue_comment['body'])
      )

      IssueCommentsDatabase.write(data)
    end

    private

    # @return [String]
    def issue_comment_id_string
      @issue_comment['id'].to_s
    end

    # @return [String]
    def issue_number_string
      @issue['number'].to_s
    end
  end
end
