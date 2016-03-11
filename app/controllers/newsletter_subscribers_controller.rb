class NewsletterSubscribersController < ApplicationController
  def create
    @newsletter_subscriber =
      NewsletterSubscriber.new(newsletter_subscriber_params)
    if @newsletter_subscriber.save
      render json: @newsletter_subscriber
    else
      render json: { errors: @newsletter_subscriber.errors },
	     status: :bad_request
    end
  end

  private def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:email)
  end
end
