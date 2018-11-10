require "./creddit/cli"
require "./creddit/io"
require "./creddit/web_client"
module Creddit
  VERSION = "0.1.0"
end

Creddit::CLI.run(io: Creddit::IO.new, web_client: Creddit::WebClient.new)
