class CardRecord
  attr_accessor :user_id,
                :car_number,
                :time,
                :must_return_at,
                :status

  def initialize(user_id, car_number,
                 permissible_time)
    @user_id        = book_id
    @car_number     = car_number
    @time           = Time.now
    @must_return_at = Time.now + permissible_time * 86400
  end

  def check
    if Time.now > @must_return_at && status != :checked && status != :returned
      @status = :checked
      -100
    else
      0
    end
  end

  def update_status
    if Time.now > @must_return_at && status != :checked && status != :returned
      @status = :returned
      -100 
    else
      @status = :returned
      0
    end
  end
end
