module Socialoud
  module Services
    class Base
      attr_reader :data, :aggregator

      def initialize(data, aggr = nil)
        @data = data
        @aggregator = aggr
      end

      def setup!
      end

      def set(key, value)
        @data[key] = value
      end

      def add_service!(name, instance)
        @aggregator.services[name] = instance
        instance.setup!
      end

      def method_missing(method, *args)
        if args.length > 0
          @data[method.to_s].send(args.shift, *args)
        else
          @data[method.to_s]
        end
      end
    end
  end
end

require 'socialoud/services/info'
require 'socialoud/services/twitter'
require 'socialoud/services/facebook'
require 'socialoud/services/github'
require 'socialoud/services/linkedin'
require 'socialoud/services/gravatar'
