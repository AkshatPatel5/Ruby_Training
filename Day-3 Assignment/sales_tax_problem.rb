# frozen_string_literal: true

class SalesOperation
  def initialize(item_details)
    @name = item_details[:product_name]
    @type = item_details[:product_type] # 1=imported, 2=basic, 3=both
    @cost_price = item_details[:cost_price].to_f
    @quantity = item_details[:quantity].to_i
    @tax = 0
  end

  def generate_tax
    @tax = ((@cost_price * 5) / 5).round / 20.0 if @type == '1'
    @tax = ((@cost_price * 10) / 5).round / 20.0 if @type == '2'
    @tax = ((@cost_price * 15) / 5).round / 20.0 if @type == '3'
    @tax
  end

  def generate_recipt
    selling_price = @quantity * (@cost_price + @tax).round(2)
    puts "#{@quantity} #{@name} :#{selling_price}"
    selling_price
  end
end
products = []
food = []
medical_products = []
food.push('chocolate bar', 'chocolate', 'imported box of chocolate', 'box of imported chocolate')
medical_products.push('packet of headache pills')
total = 0.0
sales_tax = 0.0

loop do
  puts 'Please enter your product name'
  product_name = gets.chomp

  puts "Please enter your product type\nEnter 1 for imported and 0 for non-imported"
  product_type = gets.chomp
  while product_type != '1' && product_type != '0'
    puts 'Please enter valid number for product type'
    product_type = gets.chomp
  end

  puts 'Please enter your product price'
  cost_price = gets.chomp
  while cost_price.to_f <= 0
    puts "Price can't be 0 or negative or alphabetical value"
    cost_price = gets.chomp.to_i
  end

  puts 'Please enter your quantity'
  quantity = gets.chomp
  while quantity.to_i <= 0
    puts "Quantity can't be 0 or negative or alphabetical value"
    quantity = gets.chomp.to_i
  end

  product = { product_name: product_name, product_type: product_type, cost_price: cost_price, quantity: quantity }
  products.push(product)

  puts 'Please enter 1 to add product or 0 to print recipt'
  break if gets.chomp == '0'
end

products.each do |i|
  if food.include?(i[:product_name]) || medical_products.include?(i[:product_name]) || i[:product_name] == 'book'
  elsif i[:product_type] == '1'
    i[:product_type] = '3'
  else
    i[:product_type] = '2'
  end
  item = SalesOperation.new(i)
  sales_tax += item.generate_tax
  total += item.generate_recipt
end

puts "Sales Taxes: #{sales_tax}\nTotal: #{total}"
