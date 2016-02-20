require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_create_restaurant_as_admin
    sign_in_basic users(:admin)

    assert_difference "Restaurant.count" do
      post :create, restaurant: {
        name: "Smak",
        time_zone: "0100"
      }, format: :json
      assert_response :success
    end 

    restaurant = assigns(:restaurant)
    assert_equal "Smak", restaurant.name
    assert_equal "0100", restaurant.time_zone
  end

  def test_create_restaurant_as_guest
    assert_no_difference "Restaurant.count" do
      post :create, restaurant: {
        name: "Smak",
        time_zone: "0100"
      }, format: :json
      assert_response :unauthorized
    end
  end

  def test_create_user_with_restaurant
    sign_in_basic users(:admin)

    assert_difference "User.count" do
      post :create, restaurant: {
        name: "Kalles kök",
        time_zone: "UTC",
        users_attributes: [{
          email: "kalle@example.com",
          password: "password"
        }]
      }
      assert_response :success
    end

    assert_equal "kalle@example.com", User.last.email
  end
end
