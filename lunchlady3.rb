require 'pry'
require 'colorize'

class MenuItem
  attr_reader :name, :cost, :fgrams, :cgrams, :vgrams
  def initialize(name, cost, fgrams, cgrams, vgrams)
    @name = name
    @cost = cost
    @fgrams = fgrams
    @cgrams = cgrams
    @vgrams = vgrams
  end
end

@main1 = MenuItem.new("Steak", 7.51, 1021, 513, 219)
@main2 = MenuItem.new("Chicken", 4.75, 644, 242, 140)
@main3 = MenuItem.new("Fish Pieces", 6.54, 531, 279, 83)
@side1 = MenuItem.new("Fries", 1.25, 401, 401, 104)
@side2 = MenuItem.new("Chips", 1.15, 331, 332, 105)
@side3 = MenuItem.new("Vegetable", 0.42, 20, 15, 9001)

def show_title
  puts "\n\n"
  puts "*" * 29
  puts "Jared's Adventures in Lunch Lady Land\n".colorize(:red)
  puts "*" * 29
  puts "\n\n"
end

def show_menu(menu)
  if menu == 'm'
    @item1 = @main1
    @item2 = @main2
    @item3 = @main3
    menu_title = "Please select one main course item (or an option from the menu):"
  else
    @item1 = @side1
    @item2 = @side2
    @item3 = @side3
    menu_title = "Please select a side item (or an option from the menu):"
  end
  puts menu_title
  puts "1. #{@item1.name} - $#{@item1.cost}"
  puts "2. #{@item2.name} - $#{@item2.cost}"
  puts "3. #{@item3.name} - $#{@item3.cost}"
  puts "c) Check out"
  puts "n) Nutritional 'facts'"
  puts "r) Restart order"
  puts "q) Quit program"
  print ":)"
end
money_u_got = 10
chosen = []
i = 1
while true
  if i == 1
    show_title
    menu_which = 'm'
  else
    puts "\n\n"
    menu_which = 's'
  end
  show_menu(menu_which)
  sel = gets.strip
  if sel == 'q'
    puts "\nYou'll be back."
    exit!
  elsif sel == 'c'
    #checkout
    break
  elsif sel == '1'
    puts "\nSelected #{@item1.name} for $#{@item1.cost}".colorize(:blue)
    chosen.push(@item1)
    i += 1
  elsif sel == '2'
    puts "\nSelected #{@item2.name} for $#{@item2.cost}".colorize(:blue)
    chosen.push(@item2)
    i += 1
  elsif sel == '3'
    puts "\nSelected #{@item3.name} for $#{@item3.cost}".colorize(:blue)
    chosen.push(@item3)
    i += 1
  elsif sel == 'r'
    i = 1
    chosen.clear
  elsif sel == 'n'
    puts "\n#{@item1.name}: Fats - #{@item1.fgrams} grams, Calories - #{@item1.cgrams} grams, Vitamins - #{@item1.vgrams} grams".colorize(:green)
    puts "#{@item2.name}: Fats - #{@item2.fgrams} grams, Calories - #{@item2.cgrams} grams, Vitamins - #{@item2.vgrams} grams".colorize(:green)
    puts "#{@item3.name}: Fats - #{@item3.fgrams} grams, Calories - #{@item3.cgrams} grams, Vitamins - #{@item3.vgrams} grams".colorize(:green)
  else
    puts "\nInput not valid, no selection recorded. Please try again.".colorize(:red)
  end
end

#loop end, make/show aggregate calcs
puts "\n\nYou selected the following:"
running_total = 0
ftotal = 0
ctotal = 0
vtotal = 0
chosen.each do |item|
  running_total += item.cost.to_f
  ftotal += item.fgrams.to_i
  ctotal += item.cgrams.to_i
  vtotal += item.vgrams.to_i
  puts "#{item.name} - $#{item.cost}".colorize(:green)
end

#present nutritional totals
puts "\nTotal fat: #{ftotal} grams"
puts "Total calories: #{ctotal} grams"
puts "Total vitamins: #{vtotal} grams"

#money stuff
puts "\n\nYour total cost is: $#{"%.2f" %running_total}, and you have $#{"%.2f" %money_u_got}.".colorize(:red)
if running_total > money_u_got
  puts "\nYou've spent $#{"%.2f" %(running_total - money_u_got)} too much.".colorize(:cyan)
else
  puts "\nYou have $#{"%.2f" %(money_u_got - running_total)} left.".colorize(:magenta)
end




