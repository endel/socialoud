require 'yaml'

module Socialoud
  class Client
    attr_accessor :services

    def self.configure(data)
      aggr = Client.new
      hash = data.is_a?(Hash) ? data : YAML.load_file(data)

      services = {}
      hash['services'].each_pair do |service, config|
        service_const = Socialoud::Services.const_get("#{service[0..0].upcase}#{service[1..-1]}")
        services[service] = service_const.new(config, aggr)
      end
      services.each do |name, instance|
        aggr.services[name.to_sym] = instance
        instance.setup!
      end
      aggr
    end

    def add_service!(name, instance)
      services[name] = instance
      instance.setup!
    end

    def method_missing(method, *args)
      if args.length > 0
        @services[method].send(args.shift, *args)
      else
        @services[method]
      end
    end

    def initialize(services = {})
      @services = services
    end
  end
end
