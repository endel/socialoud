require 'nokogiri'
require 'httparty'

module Socialoud
  module Services
    class Linkedin < Base
      def setup!
        #
        # Don't use Linkedin API directly to avoid a lot of bureaucracy
        #
        @page = Nokogiri::HTML.parse(HTTParty.get(@data['url']).response.body)
      end

      def user
      end

      def headline
        @page.css('headline-title title').inner_text.strip
      end

      def current
        @page.css('.summary-current ul.current li').inner_html.strip
      end

      def skills
        @page.css('ol#skills-list li a').collect {|a| a.inner_text.gsub(/\n/,'').strip }
      end

      def summary
        @page.css('p.description.summary').inner_html
      end
    end
  end
end
