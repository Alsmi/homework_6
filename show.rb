require './autobase.rb'
require './card_record.rb'
require './user_card.rb'
require './car.rb'
require 'faker'

my_autobase = Autobase.new('Саша-БАЗА')
my_autobase.buy_cars
car = my_autobase.find_car_by(:mark, 'Lanos')
user = my_autobase.add_user('Oleksandr', 'Smirnov', 'MH111333')

