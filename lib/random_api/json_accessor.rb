class JsonAccessor
  attr_accessor :code, :access_methods, :mutator

  def initialize(code, mutator)
    self.code = code
    self.access_methods = []
    self.mutator = mutator
    build
  end

  def gen_root_access_lambda
    ->(json) { json }
  end

  def gen_access_key_lambda(key)
    ->(json) { json[key] }
  end

  def build
    keys = code.split(".")
    if keys.first == "$"
      access_methods << gen_root_access_lambda
      keys.shift
    end
    keys.each do |key|
      access_methods << gen_access_key_lambda(key)
    end
  end

  def call(json)
    ret = json
    access_methods.each do |method|
      ret = method.(ret)
    end
    mutate(ret)
  end

  def mutate(value)
    unless mutator.nil?
      mutator.(value)
    else
      value
    end
  end
end