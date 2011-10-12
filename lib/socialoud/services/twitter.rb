require 'twitter'

module Socialoud
  module Services
    class Twitter < Base
      attr_reader :user

      def setup!
        @username = @data['user'] || @data
        @client = ::Twitter::Client.new
      end

      def profile_url
        "http://twitter.com/#{@username}"
      end

      def last_tweet
        last_tweets = @client.user_timeline(@data, {:count => 5})
        (last_tweets.select {|t| t['text'].index('@') != 0 }.first || last_tweets.first)['text']
      end

      #
      # Allow to retrieve each user attribute by aggr.twitter.attribute.
      #
      # Examples:
      #   aggr.twitter.is_translator
      #   aggr.twitter.profile_background_image_url_https
      #   aggr.twitter.profile_text_color
      #   aggr.twitter.followers_count
      #   aggr.twitter.protected
      #   aggr.twitter.default_profile
      #   aggr.twitter.follow_request_sent
      #   aggr.twitter.profile_background_image_url
      #   aggr.twitter.friends_count
      #   aggr.twitter.name
      #   aggr.twitter.id_str
      #   aggr.twitter.profile_link_color
      #   aggr.twitter.lang
      #   aggr.twitter.utc_offset
      #   aggr.twitter.created_at
      #   aggr.twitter.profile_image_url_https
      #   aggr.twitter.description
      #   aggr.twitter.profile_background_color
      #   aggr.twitter.listed_count
      #   aggr.twitter.notifications
      #   aggr.twitter.profile_background_tile
      #   aggr.twitter.show_all_inline_media
      #   aggr.twitter.contributors_enabled
      #   aggr.twitter.favourites_count
      #   aggr.twitter.profile_sidebar_fill_color
      #   aggr.twitter.verified
      #   aggr.twitter.profile_image_url
      #   aggr.twitter.following
      #   aggr.twitter.time_zone
      #   aggr.twitter.profile_sidebar_border_color
      #   aggr.twitter.location
      #   aggr.twitter.screen_name
      #   aggr.twitter.default_profile_image
      #   aggr.twitter.id
      #   aggr.twitter.statuses_count
      #   aggr.twitter.geo_enabled
      #   aggr.twitter.profile_use_background_image
      #   aggr.twitter.url
      #

      def method_missing(method, *args)
        fetch_user!
        @user[method.to_s]
      end

      private
        def fetch_user!
          @user ||= ::Twitter.user(@username)
        end

    end
  end
end
