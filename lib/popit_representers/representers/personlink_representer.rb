require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

module Popit
  module PersonlinkRepresenter
    include Roar::Representer::JSON

    module Initializer
      def initialize
        extend Popit::PersonlinkRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    property :id
    property :note
    property :url

  end
end