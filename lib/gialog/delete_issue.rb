# frozen_string_literal: true

require 'pathname'

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
      pathname.rmtree
    end

    private

    # @return [String]
    def path
      format(
        'data/issues/%<issue_number>s',
        issue_number: @issue['number']
      )
    end

    # @return [Pathname]
    def pathname
      ::Pathname.new(path)
    end
  end
end
