module Plugins
  class Beep
    def initialize(teaclock)
      teaclock.ui.extend(UiWithBeep)
    end

    module UiWithBeep
      def notify(msg)
        puts "BEEP!"
        super
      end
    end
  end
end

class TeaClock
  attr_accessor :timer
  attr_accessor :ui

  def initialize(seconds)
    @ui = StdioUi.new
    @timer = SleepTimer.new(seconds, ui)
    init_plugins
  end

  def start
    timer.start
  end

  private

  def init_plugins
    @plugins = []
    ::Plugins.constants.each do |name|
      puts "initializing #{name} Plugin"
      @plugins << ::Plugins.const_get(name).new(self)
    end
  end
end

SleepTimer = Struct.new(:seconds, :notifier) do
  def start
    sleep seconds
    notifier.notify("Tea is ready!")
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
# timer = SleepTimer.new(1, notifier)
# timer.start

class StdioUi
  def notify(text)
    puts text
  end
end

TeaClock.new(1).start
