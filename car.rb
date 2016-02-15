class Car
  attr_reader :mark,
              :model,
              :number,
              :id,
              :status,
              :cost

  @@cars_count = 0

  def initialize(mark, model, number, cost)
    @@cars_count += 1
    @id      = @@cars_count
    @mark    = mark
    @model   = model
    @number  = number
    @status  = :in_autobase
    @cost    = cost
  end

  def change_status
    case @status
    when :in_autobase
      @status = :rent
    when :rent
      @status = :in_autobase
    end
  end
  
  def to_s
    puts "=============auto №#{@number}==============="
    puts "Mark: #{@mark}"
    puts "Model: #{@model}"
    puts "Status: #{@status}"
    puts "Cost: #{@cost}"
    puts '======================================='
    puts
  end
end
