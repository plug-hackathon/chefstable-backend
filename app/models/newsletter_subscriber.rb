class NewsletterSubscriber < ActiveRecord::Base
  EMAIL_FORMAT = %r(\A\S+@\S+\z)

  validates :email, presence: true, format: { with: EMAIL_FORMAT }
end
