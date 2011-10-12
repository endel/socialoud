require 'octopi'

module Socialoud
  module Services
    class Github < Base
      attr_reader :user

      def repositories
        Octopi::Repository.find(:user => @data)
      end

      def profile_url

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
          @user ||= Octopi::User.find(@data)
        end
    end
  end
end
