class FakeIO
  getter sent_messages
  getter outgoing_messages

  def initialize(outgoing_messages)
    @sent_messages = [] of String
    @outgoing_messages = outgoing_messages
  end

  def initialize
    @sent_messages = [] of String
    @outgoing_messages = [] of String
  end

  def puts(msg)
    sent_messages << msg
  end

  def gets
    return nil if outgoing_messages.empty?
    outgoing_messages.shift
  end
end
