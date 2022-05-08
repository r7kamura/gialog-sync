module Gialog
  class IssueCommentsDatabase < Database
    # @return [String]
    def path
      'data/issue_comments.json'
    end
  end
end
