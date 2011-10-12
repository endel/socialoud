module Socialoud
  module Services
    class Facebook < Base
      def setup!
      end

      #
      # TODO: add more methods to this service
      #

      def profile_url
        "http://www.facebook.com.br/#{@data}"
      end
    end
  end
end
