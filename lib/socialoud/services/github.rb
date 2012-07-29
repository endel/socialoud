require 'github_api'

module Socialoud
  module Services
    class Github < Base
      attr_reader :user

      def repositories
        fetch_user!
        @user.repos.all
      end

      def followers
        fetch_user!
        @user.users.followers.all
      end

      def profile_url
        "http://github.com/#{@data['user'] || @data}"
      end

      def method_missing(method, *args)
        fetch_user!
        if args.length > 0
          @user.send(method, *args)
        else
          @user.send(method)
        end
      end

      private
        def fetch_user!
          @user ||= begin
                      raise "Github config error: 'user' and 'password' are required." if @data['user'].nil? || @data['password'].nil?
                      ::Github.new(:basic_auth => "#{@data['user']}:#{@data['password']}")
                    end
        end
    end
  end
end
