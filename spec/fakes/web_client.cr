class FakeWebClient
  getter requests

  def initialize
    @requests = [] of Hash(Symbol, String)
  end

  def get(url)
    requests.push(Hash{:get => url})
    "Success"
  end
end
