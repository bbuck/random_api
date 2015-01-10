require "random_api/json_accessor"

class JsonObject
  class << self
    def map_method(name, json_path, mutator = nil)
      accessors[name] = JsonAccessor.new(json_path, mutator)
    end

    def accessors
      @accessors ||= {}
    end
  end

  attr_accessor :_json

  def initialize(json)
    self._json = json
  end

  def respond_to_missing?(name, include_private = false)
    name = name.to_sym
    self.class.accessors.has_key?(name)
  end

  def method_missing(name, *args)
    name = name.to_sym
    if respond_to_missing?(name)
      accessor = self.class.accessors[name]
      accessor.(self._json)
    else
      super
    end
  end
end