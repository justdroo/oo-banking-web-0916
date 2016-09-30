require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if @sender.valid? == false || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status != "complete"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end #end Transfer
