# frozen_string_literal: true
 
class Classifier
  FOODS = ['chocolate'].freeze
  MEDICINES = ['pills'].freeze
 
  def is_tax_exempt?(product_title)
    @product_title = product_title
 
    is_food? || is_medicine? || is_book?
  end
 
  def is_food?
    FOODS.any? { |food| @product_title.include?(food) }
  end
 
  def is_medicine?
    MEDICINES.any? { |medicine| @product_title.include?(medicine) }
  end
 
  def is_book?
    @product_title.include?('book')
  end
end
 
class Order
  attr_reader :qtd, :title, :unit_price, :tax, :price_with_tax, :is_imported, :tax_exempt
 
  def transform(plain_order:, classifier:, taxcalculator:)
    @plain_order = plain_order
    @classifier = classifier
    @taxcalculator = taxcalculator
 
    serialize
    classify
    taxify
    self
  end
 
  def price_with_tax
    (price + tax).round(2)
  end
 
  def price
    @qtd * @unit_price
  end
 
  private
 
  def serialize
    string_qtd, rest = @plain_order.split(' ', 2)
    @qtd = string_qtd.to_i
    @title, string_price = rest.split(' at ', 2)
    @unit_price = string_price.to_f
    @is_imported = @title.include?('imported')
  end
 
  def classify
    @tax_exempt = @classifier.is_tax_exempt?(@title)
  end
 
  def taxify
    @tax = @taxcalculator.calculate(price, @is_imported, @tax_exempt)
  end
end
 
class Orders
  attr_reader :list
 
  def initialize
    @list = []
  end
 
  def <<(product)
    @list << product
  end
 
  def total_price_with_taxes
    @list.map(&:price_with_tax).inject(0, &:+)
  end
 
  def total_taxes
    (@list.map(&:tax).inject(0, &:+) * 20).round / 20.0
  end
end
 
class Recipt
  def print(orders)
    @orders = orders
 
    print_orders_list
    print_sales_tax
    print_total_price
  end
 
  private
 
  def print_orders_list
    order_list = @orders.list.map do |order|
      "#{order.qtd} #{order.title}: #{order.price_with_tax}"
    end
 
    puts(order_list)
  end
 
  def print_sales_tax
    puts("Sales Taxes: #{@orders.total_taxes}")
  end
 
  def print_total_price
    puts("Total: #{@orders.total_price_with_taxes}")
  end
end
 
class TaxCalculator
  BASIC_SALES_TAX_PERCENT = 10
  IMPORTED_TAX_PERCENT = 5
 
  def calculate(price, is_imported, tax_exempt)
    @price = price
    @is_imported = is_imported
    @tax_exempt = tax_exempt
 
    simple_tax + import_tax
  end
 
  private
 
  def simple_tax
    @tax_exempt ? 0 : percent(@price, BASIC_SALES_TAX_PERCENT)
  end
 
  def import_tax
    @is_imported ? percent(@price, IMPORTED_TAX_PERCENT) : 0
  end
 
  def percent(value, percentage)
    (value * percentage / 5).round / 20.0
  end
end
 
class SalesOperation
  def initialize
    @classifier = Classifier.new
    @orders = Orders.new
    @recipt = Recipt.new
    @taxcalculator = TaxCalculator.new
  end
 
  def run
    items = []
    puts "Please enter product details, Enter 0 after completion"
    loop do
      i = gets.chomp
      break if i == '0'
     
      items.push(i)
    end
    items.each do |item|
      order = Order.new.transform(plain_order: item, classifier: @classifier, taxcalculator: @taxcalculator)
      @orders << order
    end
 
    @recipt.print(@orders)
  end
end
SalesOperation.new.run