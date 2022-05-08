require 'octokit'

module Gialog
  class ConvertMarkdownToHtml
    class << self
      # @param [String] text
      def call(text)
        new(text).call
      end
    end

    # @param [String] text
    def initialize(text)
      @text = text
    end

    # @return [String]
    def call
      return unless @text

      client.markdown(
        @text,
        context: context,
        mode: 'gfm',
      ).force_encoding('UTF-8')
    end

    private

    # @return [Octokit::Client]
    def client
      ::Octokit::Client.new(access_token: github_access_token)
    end

    # @return [String]
    def context
      ::ENV['GITHUB_REPOSITORY']
    end

    # @return [String]
    def github_access_token
      ::ENV['GITHUB_TOKEN']
    end
  end
end
