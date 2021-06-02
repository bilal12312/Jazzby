class OrderMailer < ApplicationMailer
	default from: "bkhalid0311@gmail.com"

	  def deliver_email(order)
	    @order = order
	    @url  = 'http://localhost:3000/orders'
	    mail(to: @order.email, subject: 'Your order has been successfully delivered.')
	  end
end
