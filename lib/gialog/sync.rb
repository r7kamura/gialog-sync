# frozen_string_literal: true

module Gialog
  class Sync
    class << self
      def call
        new.call
      end
    end

    def call
      case github_event_name
      when 'issues'
        case github_action_name
        when 'deleted'
          DeleteIssue.call(payload['issue'])
        else
          UpdateIssue.call(payload['issue'])
        end
      when 'issue_comment'
        case github_action_name
        when 'deleted'
          DeleteIssueComment.call(
            issue: payload['issue'],
            issue_comment: payload['comment']
          )
        else
          UpdateIssueComment.call(
            issue: payload['issue'],
            issue_comment: payload['comment']
          )
        end
      else
        raise ::NotImplementedError, "Unknown event name: #{github_event_name.inspect}"
      end
    end

    private

    # @return [String]
    def github_action_name
      payload['action']
    end

    # @return [String]
    def github_event_name
      ::ENV['GITHUB_EVENT_NAME']
    end

    # @return [Hash]
    def payload
      @payload ||= GetGitHubPayload.call
    end
  end
end
