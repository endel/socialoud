module Socialoud
  module Services
    class Info < Base
      def setup!
        add_service!(:gravatar, Gravatar.new(email))
      end
    end
  end
end
