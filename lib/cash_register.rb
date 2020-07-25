class CashRegister
  attr_accessor :name, :price, :total, :discount, :quantity

  def initialize(discount=0)
   @discount=discount
    @total=0
 @@all=[]

  end 
 
 def add_item (name, price,quantity=1)
   @name=name
   @price=price
   @total+=price*quantity
   @quantity=quantity
     for counter in 1..quantity
   @@all<<self.name
end
 end
 
 def apply_discount
   # @total+=price*quantity
   if (@discount!=0)
   @total=@total-(@price*@discount*@quantity/100)
  
  return "After the discount, the total comes to $#{@total.to_s}."
else
  return "There is no discount to apply."
  end
end
def items

 

return @@all
end
 
  def void_last_transaction
  @total=@total-(@price*(1-@discount/100)*@quantity)
  end
end
