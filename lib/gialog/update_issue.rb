# frozen_string_literal: true

module Gialog
  class UpdateIssue
    class << self
      # @param [Hash] issue
      def call(issue)
        new(issue).call
      end
    end

    # @param [Hash] issue
    def initialize(issue)
      @issue = issue
    end

    def call
      data = IssuesDatabase.read
      data['issues'] ||= {}
      data['issues'][@issue['number'].to_s] = @issue.merge(
        'bodyHTML' => ConvertMarkdownToHtml.call(@issue['body'])
      )
      IssuesDatabase.write(data)
    end
  end
end
