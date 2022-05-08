module Gialog
  class DeleteIssue
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
      data['issues'].delete(issue_number_string)
      IssuesDatabase.write(data)

      data = IssueCommentsDatabase.read
      data['issue_comments'].delete(issue_number_string)
      IssueCommentsDatabase.write(data)
    end

    private

    # @return [String]
    def issue_number_string
      @issue['number'].to_s
    end
  end
end
