class Autobase
  attr_accessor :cars,
                :user_cards,
                :account

  PERMISSIBLE_TIME = 0              

  def initialize(name)
    @name       = name
    @cars       = []
    @user_cards = []
    @account    = 10000
  end

  def buy_cars
    while @account > 0
      car = get_car
      try_buy(car)
    end
  end

  def try_buy(car)
    return false if @account < car.cost
    @cars << car
    @account -= car.cost
  end

  def all_cars_info
    @cars.each do |car|
      car.to_s
    end
  end

  def find_car_by(by, mark)
    @cars.find do |car|
      mark == car.send(by.to_sym)
    end
  end

  def find_all_cars_by(by, mark)
    @cars.find_all do |car|
      mark == car.send(by.to_sym)
    end
  end

  def rental(car_id, user_id)
    user_card = find_user_card(user_id)
    car       = find_car_by(:id, car_id)
    unless car_present?(car)
      puts 'Car not present!'
      return   
    end
    if debt?(user_card)
      please_pay(user_card.current_sum)
    else
      user_card.make_record(car_id, car_number, PERMISSIBLE_TIME)
      car.change_status
    end
  end

  def return_car(car_id, user_id)
    user_card = find_user_card(user_id)
    car         = find_car_by(:id, car_id)
    user_card.remove_record(car_id)
    car.change_status
  end

  def debt?(user_card)
    user_card.update_info
    return true if user_card.has_debt?
    false
  end

  def find_user_card(user_id)
    @user_cards.find { |card| card.id == user_id }
  end

  def pay(user_id, sum)
    user_card = find_user_card(user_id)
    user_card.add_to_sum(sum)
    @account += sum
  end

  def add_user(first_name, last_name, pasport_data)
    card = UserCard.new(first_name, last_name, pasport_data)
    @user_cards << card
    card
  end

  def car_present?(car)
    return false if car.nil?
    car.status == :in_autobase
  end

  private

    def please_pay(sum)
      puts "Пожалуйста погасите задолженость #{sum} грн."
    end

   def get_car
      mark       = Faker::Car.mark
      model      = Faker::Car.model
      number     = Faker::Car.number
      cost       = Faker::Commerce.price
      Car.new(mark, model, number, cost)
    end
end
