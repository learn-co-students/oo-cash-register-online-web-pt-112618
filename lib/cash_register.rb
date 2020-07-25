class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items

  def initialize (discount = 0)
    @total = 0
    @discount = discount
  #  @discount = (100 - discount.to_f)/100
    @items = []
  end

  def add_item (title, price, quantity = 1)
    self.total += price*quantity
    quantity.times {@items.push(title)}
    self.last_transaction = {title: title, price: price, quantity: quantity}
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total * ((100 - discount.to_f)/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= (self.last_transaction[:price] * self.last_transaction[:quantity])
  end

end
