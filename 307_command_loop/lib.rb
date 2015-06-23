class CommandLoop
  def start
    while (print "> "; input = gets) do
      input.chomp!.downcase!
      puts input.inspect
    end
  end
end

command_loop = CommandLoop.new
command_loop.start

require 'benchmark/ips'

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.time = 5
  x.warmup = 2

  x.report("chomp.downcase")   { "aAffjaaf\nalskjfhFfj\n".chomp.downcase }
  x.report("chomp!.downcase!") { "aAffjaaf\nalskjfhFfj\n".chomp!.downcase!  }

  x.compare!
end

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.time = 5
  x.warmup = 2

  x.report("chomp")   { "aAffjaaf\nalskjfhFfj\n".chomp }
  x.report("chomp!") { "aAffjaaf\nalskjfhFfj\n".chomp!  }

  x.compare!
end

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.time = 5
  x.warmup = 2

  x.report("downcase")   { "aAffjaaf\nalskjfhFfj\n".downcase}
  x.report("downcase!")  { "aAffjaaf\nalskjfhFfj\n".downcase! }

  x.compare!
end

at_exit do
  puts "\n\n...Goodbye!"
end
