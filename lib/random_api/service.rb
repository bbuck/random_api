require "httparty"

require "random_api/user"

class RandomApi::Service
  include HTTParty

  base_uri "api.randomuser.me/0.4.1"

  def initialize(api_key = nil)
    @api_key = api_key
  end

  def user(options = {})
    options = options.dup
    options.delete(:results) # Single user request, no need
    options = {
      query: default_query_options.merge(query_options_from(options))
    }
    RandomApi::User.new(self.class.get("/", options)["results"].first)
  end

  def users(count, options = {})
    options = options.dup
    options[:results] = count
    options = {
      query: default_query_options.merge(query_options_from(options))
    }
    results = self.class.get("/", options)["results"]
    results.map { |data| RandomApi::User.new(data) }
  end

  def to_s
    "RandomAPI Service " + (@api_key.nil? ? "no api key given" : @api_key)
  end

  def inspect
    "#<RandomApi::Service " + (@api_key.nil? ? "anonymous" : "setup with key") + ">"
  end

  private

  def query_options_from(options)
    query = {}
    valid_options.each do |key|
      query[key] = options[key] if options.has_key?(key)
    end
    query
  end

  def valid_options
    @_valid_options ||= [:results, :gender, :seed]
  end

  def default_query_options
    query = {
      results: 1
    }
    query[:key] = @api_key unless @api_key.nil?
    query
  end

  def request_options
    opts = {}
    opts[:query] = {}
    opts[:query][:key] = @api_key unless @api_key.nil?
  end
end