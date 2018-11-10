require "http/client"
require "json"

module Creddit
  class WebClient
    def get(url)
      response = HTTP::Client.get(url)
      JSON.parse(response.body.lines.join)
    end
  end
end
