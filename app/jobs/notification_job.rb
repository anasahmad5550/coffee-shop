# app/jobs/notification_job.rb
class NotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    OrderMailer.notify_customer(order).deliver_later
  end
end
