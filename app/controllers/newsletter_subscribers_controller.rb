class NewsletterSubscribersController < ApplicationController
  before_action :set_newsletter_subscriber, except: %i(create)

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

  def destroy
    if @newsletter_subscriber.destroy
      render json: @newsletter_subscriber
    else 
      render json: { errors: @newsletter_subscriber.errors },
      status: :bad_request
    end
  end

  private def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:email)
  end

  private def set_newsletter_subscriber
    @newsletter_subscriber = NewsletterSubscriber.find params[:id]
  end
end
