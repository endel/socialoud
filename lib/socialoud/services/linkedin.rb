require 'nokogiri'
require 'httparty'

module Socialoud
  module Services
    #
    # LinkedIn service class doesn't use official API calls to avoid superfluous authentication
    #
    class Linkedin < Base
      def setup!
        @page = Nokogiri::HTML.parse(HTTParty.get(@data['url']).response.body)
      end

      def profile_url
        @data['url']
      end

      def full_name
        clean_str!(@page.css('#name .full-name').inner_text)
      end

      def first_name
        clean_str!(@page.css('#name .given-name').inner_text)
      end

      def family_name
        clean_str!(@page.css('#name .family-name').inner_text)
      end

      def headline
        clean_str!(@page.css('.headline-title.title').inner_text)
      end

      def current
        clean_str!(@page.css('.summary-current ul.current li').inner_html.strip.gsub(/<\/?[^>]*>/, ""))
      end

      # Returns an Array of skills
      def skills
        @page.css('ol#skills-list li a').collect {|a| a.inner_text.gsub(/\n/,'').strip }
      end

      def summary
        clean_str!(@page.css('p.description.summary').inner_html)
      end

      protected
        def clean_str!(str)
          str.gsub(/ +/, ' ').strip
        end
    end
  end
end
