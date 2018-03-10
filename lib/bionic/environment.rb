# frozen_string_literal: true

module Bionic
  class Environment < String
    def initialize(env)
      super(env || 'development')
    end

    private

    def respond_to_missing?(method_name, _include_private = false)
      method_name[-1] == '?'
    end

    def method_missing(method, *args)
      method[-1] == '?' ? self == method[0..-2] : super
    end
  end
end
