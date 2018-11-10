module Creddit
  class CLI
    def self.run(io, web_client)
      io.puts "Which subreddit do you want?"
      subreddit = io.gets
      if subreddit && !subreddit.empty?
        io.puts "Fetching /r/#{subreddit.chomp}"
        response = web_client.get("https://www.reddit.com/r/#{subreddit}.json")
        children = response["data"]["children"].as_a
        children.each.with_index(1) do |post, i|
          puts %Q[#{i}. #{post["data"]["title"]}]
        end
      else
        io.puts "Invalid Selection. Fetching home page"
        response = web_client.get("https://www.reddit.com/.json")
        children = response["data"]["children"].as_a
        children.each.with_index(1) do |post, i|
          puts %Q[#{i}. #{post["data"]["title"]}]
        end
      end
    end
  end
end
