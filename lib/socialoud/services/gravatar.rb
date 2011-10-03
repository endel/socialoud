require 'digest/md5'

module Socialoud
  module Services
    class Gravatar < Base
      def setup!
        @hash = Digest::MD5.hexdigest(@data)
      end

      def image(size = 200)
        "http://www.gravatar.com/avatar/#{@hash}?s=#{size}"
      end

      def profile
        "http://www.gravatar.com/#{@hash}"
      end
    end
  end
end
