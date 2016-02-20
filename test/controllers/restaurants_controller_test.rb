require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_create_restaurant
    assert_difference "Restaurant.count" do
      post :create, restaurant: {
        name: "Smak",
        time_zone: "0100"
      }, format: :json
      assert_response :success
    end 

    assert_equal "foo", response.body

    restaurant = assigns(:restaurant)
    assert_equal "Smak", restaurant.name
    assert_equal "0100", restaurant.time_zone
  end
end