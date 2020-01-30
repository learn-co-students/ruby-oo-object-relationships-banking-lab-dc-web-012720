class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?()
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction()
    if self.valid? && self.status != 'complete' && self.sender.balance > amount
      self.sender.balance -=  self.amount
      self.receiver.deposit(self.amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer()
    if self.status == 'complete'
      self.receiver.balance -= self.amount
      self.sender.deposit(self.amount)
      self.status = 'reversed'
    end

  end

end
