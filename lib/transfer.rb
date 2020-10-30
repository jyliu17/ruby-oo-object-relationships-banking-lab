class Transfer
attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @sender = sender 
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end
    
    def valid?
       self.sender.valid? && self.receiver.valid?
    end

    def execute_transaction

      if self.valid? && sender.balance >= amount && status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else #sender.balance < amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."

      end

        # if sender.balance < @amount
        #     @status = "rejected"
        #     print "Transaction rejected. Please check your account balance."
        # else sender.balance >= amount && status == "pending"
        #     @sender.balance -= @amount
        #     @receiver.balance += @amount
        #     @status = "complete"
        # end

    end

    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount

        @status = "reversed"
      end
    end

    

end


# Checks for errors on an object (i.e., is resource.errors empty?).

# Runs all the specified local validations and returns true if no errors were added, otherwise false. 
# Runs local validations (eg those on your Active Resource model), and also any errors returned from the remote system the last time we saved. Remote errors can only be cleared by trying to re-save the resource.


# my_person = Person.create(params[:person])
# my_person.valid?
# # => true