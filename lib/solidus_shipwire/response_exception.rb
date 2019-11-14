# frozen_string_literal: true

module SolidusShipwire
  class ResponseException < RuntimeError
    attr_reader :response

    def initialize(response)
      @response = response
    end
  end
end
