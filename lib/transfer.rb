class Transfer
  attr_reader :sender, :receiver, :amount


  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance < self.amount
      puts "You need more money"
      return nil
    else
    self.sender.balance -= amount
    self.receiver.balance += amount
    end
  end

  def reverse_transfer
    
  end

end