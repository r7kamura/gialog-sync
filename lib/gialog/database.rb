# frozen_string_literal: true

require 'json'
require 'pathname'

module Gialog
  class Database
    DEFAULT_VALUE = {}.freeze

    class << self
      # @return [Hash]
      def read
        new.read
      end

      # @param [Hash] data
      def write(data)
        new.write(data)
      end
    end

    # @return [Hash]
    def read
      if pathname.exist?
        ::JSON.parse(pathname.read)
      else
        DEFAULT_VALUE
      end
    end

    # @param [Hash] data
    def write(data)
      pathname.parent.mkpath
      pathname.write(
        ::JSON.dump(data)
      )
    end

    private

    # @return [Pathname]
    def pathname
      ::Pathname.new(path)
    end

    # @return [String]
    def path
      raise ::NotImplementedError
    end
  end
end
