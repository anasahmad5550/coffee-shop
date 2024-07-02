class OrderMailer < ApplicationMailer

  def notify_order_prepared(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: 'Please collect your order.')
  end
end
