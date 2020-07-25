require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = total
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do  #(ITEMS)THIS IS THE AREA I HAD TROUBLE WITH I COMPLETELY FORGOT ABOUT .TIMES LOOP
      @items << title #My previous code has self.items for all of the instance variables and it worked... was it only because I didn't have class variables for it to refer back to?
    end
      @last_transaction = price * quantity
  end

  def apply_discount
    #binding.pry
    new_total = (@total *= (1 - (@discount.to_f / 100))).to_i

    if @discount != 0
       "After the discount, the total comes to $#{new_total}."
    else
       "There is no discount to apply."
    end
  end

  def items_array
    @items
  end

  def void_last_transaction #Bring add item method into this method and @total instance variable
    @total = @total - @last_transaction #had trouble with this method so I viewed the solution
  end
end
