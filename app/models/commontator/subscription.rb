module Commontator
  class Subscription < ApplicationRecord
    belongs_to :subscriber, polymorphic: true
    belongs_to :thread

    validates :subscriber, :thread, presence: true
    validates :thread_id, uniqueness: { scope: %i[subscriber_type subscriber_id] }

    def self.comment_created(comment)
      recipients = comment.thread.subscribers.reject { |s| s == comment.creator }
      return if recipients.empty?

      mail = SubscriptionsMailer.comment_created(comment, recipients)
      mail.respond_to?(:deliver_later) ? mail.deliver_later : mail.deliver
    end

    def unread_comments
      created_at = Comment.arel_table[:created_at]
      thread.filtered_comments.where(created_at.gt(updated_at))
    end
  end
end
