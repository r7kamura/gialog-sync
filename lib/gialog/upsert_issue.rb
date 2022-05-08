# frozen_string_literal: true

require 'pathname'
require 'yaml'

module Gialog
  class UpsertIssue
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
      file_content = generate_file_content
      pathname.parent.mkpath
      pathname.write(file_content)
    end

    private

    # @return [String]
    def generate_file_content
      body = @issue.delete('body')
      [
        @issue.to_yaml,
        body
      ].join("\n---\n")
    end

    # @return [String]
    def path
      format(
        'data/issues/%<issue_number>s/issue.md',
        issue_number: @issue['number']
      )
    end

    # @return [Pathname]
    def pathname
      ::Pathname.new(path)
    end
  end
end
