require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    @workers = Stack.new
    jobs_available.times do |number|
      @workers.push("Worker ##{number + 1}")
    end
    # @workers = jobs_available
    @waiting = Queue.new
    until job_seekers == jobs_available
    @waiting.enqueue("Worker ##{job_seekers}")
    job_seekers -= 1
    end
    # @waiting = @waiting.reverse
    @roll = rand(1..6)
  end

  def cycle
    @roll = rand(1..6)
    puts "Manager rolls a #{@roll}"
    @roll.times do
      fired = @workers.pop
      @waiting.enqueue(fired)
    end

    @roll.times do
      hired = @waiting.dequeue
      @workers.push(hired)
    end

  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
