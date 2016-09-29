class CashRegister
  attr_reader :total, :discount

  def initialize(discount=0)
    @total = 0
    self.discount=(discount)
  end

  def discount=(discount)
    @discount = discount
  end

  def total=(num)
    @total = num.to_i
  end

  def add_item(item, price, quantity = 1)
    @price = price
    @total += (price * quantity)
    @items ||= []
    quantity.times {@items << item}
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= (@total * @discount/100).to_f
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @price
    @items.pop()
  end
end
