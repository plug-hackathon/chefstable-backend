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

  def test_delete
    NewsletterSubscriber.create(id: 1, email: 'test@example.com') 
    assert_difference "NewsletterSubscriber.count", -1 do 
      delete :destroy, id: NewsletterSubscriber.last.id 
    end
    assert_response :success
    json = JSON.parse(response.body)
    newsletter_subscriber = assigns(:newsletter_subscriber)
    assert_equal json['id'], newsletter_subscriber.id
  end
end
