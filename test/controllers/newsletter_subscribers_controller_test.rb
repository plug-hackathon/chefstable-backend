require 'test_helper'

class NewsletterSubscribersControllerTest < ActionController::TestCase
  def test_create
    assert_difference "NewsletterSubscriber.count" do
      post :create, newsletter_subscriber: {
        email: "test@example.com"
      }
    end
    assert_response :success
    json = JSON.parse(response.body)
    newsletter_subscriber = assigns(:newsletter_subscriber)
    assert_equal json['id'], newsletter_subscriber.id
  end
end
