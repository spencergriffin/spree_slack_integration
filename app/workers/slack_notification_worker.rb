require 'slack-notifier'

class SlackNotificationWorker
  include Sidekiq::Worker

  def perform(order_number)
    order = Spree::Order.find_by_number(order_number)
    notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'])
    notifier.ping(order.slack_notification_message)
  end
end
