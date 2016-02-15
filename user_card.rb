class UserCard
  attr_accessor :first_name,
                :last_name,
                :pasport_data,
                :id,
                :current_sum

  attr_reader :records

  @@users_count = 0

  def initialize(first_name,
                 last_name, pasport_data)
    @@users_count += 1
    @id           = @@users_count
    @pasport_data = pasport_data
    @first_name   = first_name
    @last_name    = last_name
    @records      = []
    @current_sum  = 0
  end

  def make_record(car_id, car_number, permissible_time)
    record = CardRecord.new(car_id, car_number, permissible_time)
    @records << record
    return record
  end

  def remove_record(car_id)
    record = @records.find { |record| record.car_id ==  car_id }
    @current_sum += record.update_status
  end

  def update_info
    @records.each { |record| @current_sum += record.check }
  end

  def add_to_sum(sum)
    @current_sum += sum
  end

  def has_debt?
    @current_sum < 0
  end
end
