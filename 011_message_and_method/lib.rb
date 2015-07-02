class TeaClock
  attr_accessor :timer
  attr_accessor :ui
end

SleepTimer = Struct.new(:seconds, :notifier) do
  def start
    sleep seconds
    notifier.call("Tea is ready!")
  end
end

# notifier = lambda { |msg| puts msg }

# notifier = ->(msg) { puts msg }

# notifier = Proc.new { |msg| puts msg }

# notifier = proc { |msg| puts msg }

# class Notifier
#   def notify(msg)
#     puts msg
#   end
# end
# notifier_instance = Notifier.new
# notifier = notifier_instance.method(:notify)

timer = SleepTimer.new(1, notifier)

# timer.start

class StdioUi
  def notify(text)
    puts text
  end
end
