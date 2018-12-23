require 'pry'

class CashRegister 
  attr_accessor :total, :discount, :item, :quantity, :price, :items, :last_transaction
  
  @@unit_price = []
  
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end
  
  
  def add_item(item, price, quantity = 1) 
    @item = item
    @quantity = quantity
    unless quantity < 1
      self.total += price * quantity
      @@unit_price << price * quantity
      
      while quantity > 0
      @items << item
      quantity -= 1
      end 
    end
  end
  
  def apply_discount 
    if self.discount != 0 
      discounted_price = self.total = (self.total * ((100 - self.discount) * 0.01)).round
      "After the discount, the total comes to $#{discounted_price}."
    else 
      "There is no discount to apply."
    end
  end 
  
  def void_last_transaction
    @last_transaction = @@unit_price[@@unit_price.length-1]
    @total -= @last_transaction
  end 
  
end
