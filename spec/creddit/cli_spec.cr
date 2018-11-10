require "../spec_helper"
require "http/client"

describe Creddit::CLI do
  it "defaults to home page if subreddit not provided" do
    io = FakeIO.new
    web_client = FakeWebClient.new
    Creddit::CLI.run(io: io, web_client: web_client)
    io.sent_messages.should eq(["Which subreddit do you want?", "Invalid Selection. Fetching home page"])
    web_client.requests.should eq([{:get => "https://www.reddit.com/.json"}])
  end

  it "returns home page if empty string provided" do
    io = FakeIO.new([""])
    web_client = FakeWebClient.new
    Creddit::CLI.run(io: io, web_client: web_client)
    io.sent_messages.should eq(["Which subreddit do you want?", "Invalid Selection. Fetching home page"])
    web_client.requests.should eq([{:get => "https://www.reddit.com/.json"}])
  end

  # CLI.run
  # >> Print to IO
  # Which subreddit do you want?
  # >> get input
  # Take my selection
  # >>MNClient.get("https://reddit.com/r/#{selection}.json
  # Returns String > Parse JSON > show 10 stories
  # Shows top 10 stories with links
  # >> Format output
  # Takes input to open in browser
  # IO.gets takes a selection
end
