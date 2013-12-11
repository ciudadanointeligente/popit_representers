require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'active_model'

module Popit
  module PersonRepresenter
    include Roar::Representer

    module Initializer
      def initialize
        extend Popit::PersonRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::JSON
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    self.representation_wrap= :result

    property :name

  end
end