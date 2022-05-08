# frozen_string_literal: true

module Gialog
  class IssuesDatabase < Database
    # @return [String]
    def path
      'data/issues.json'
    end
  end
end
