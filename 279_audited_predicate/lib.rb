class TimeChecker
  def initialize(time)
    @time = time
  end

  def valid?(auditor = ->(*, &block) { block.call })
    return false if auditor.("Sunday") { time.sunday? }
    return false if auditor.("Saturday") { time.saturday? }
    return false unless auditor.("Valid UTC Time") { time.utc? }
  end

  private

  attr_reader :time
end

time = Time.now

auditor = ->(description, &block) {
  result = block.call
  puts "#{description} : #{result}"
  result
}

class Auditor
  def initialize
    @results = {}
  end

  def call(description, &block)
    result = block.call
    @results[description] = result
    result
  end
end

auditor = Auditor.new
result = TimeChecker.new(time).valid?(auditor)
