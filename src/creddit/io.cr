module Creddit
  class IO
    def puts(value)
      STDOUT.puts value
    end

    def gets
      STDIN.gets
    end
  end
end
