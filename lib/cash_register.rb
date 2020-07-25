class CashRegister
  attr_accessor :total, :discount, :lastTransaction, :list
    def initialize(discount=0)
      @discount = discount
      @total = 0
      @lastTransaction = 0
      @list = Array.new
    end  
    
    def total
        @total
    end
    
    def add_item(title, price, quantity=0)
      previous_total = @total
      @lastTransaction = price
      limit = 0
      if quantity != 0
        new_price = quantity * price
          @total += new_price
            while limit < quantity
              @list << title
              limit += 1
            end
      else
        @total += price
        @list << title
      end
      previous_total
    end
    
    def apply_discount
      new_price = 0
      
        if @discount > 0
          @discount = @total * (@discount * 0.01)
          @total = @total - @discount
          return "After the discount, the total comes to $#{@total.round}."
           @total = new_price - @discount
        else
          return "There is no discount to apply."
        end
       
    end
    
    def items
      @list
    end  
    
    def void_last_transaction
      @total = @total - @lastTransaction
    end
  
end
