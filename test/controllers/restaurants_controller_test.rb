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

  def test_index_restaurants
    sign_in_basic users(:admin)

    get :index 
    assert_response :success
    json = JSON.parse(response.body)
    
    restaurant = Restaurant.find(json.first['id'])
    assert_equal json.first['id'], restaurant.id
    assert_equal json.first['name'], restaurant.name
    assert_equal json.first['time_zone'], restaurant.time_zone
    assert_equal json.first['opening_hours'], nil
    assert_equal json.first['restricted_hours'], nil
  end

  def test_show_restaurant
    get :show, id: restaurants(:one).id 
    assert_response :success
    json = JSON.parse(response.body)

    assert_equal json['id'], restaurants(:one).id
    assert_equal json['name'], restaurants(:one).name
    assert_equal json['time_zone'], restaurants(:one).time_zone
    assert_equal json['opening_hours'].count, restaurants(:one).opening_hours.count
    assert_equal json['restricted_hours'].count, restaurants(:one).restricted_hours.count
    assert_equal json['bookings'], nil
    assert_equal json['users'], nil
  end 

end