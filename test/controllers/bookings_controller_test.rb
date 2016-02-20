require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  def test_create
    assert_difference "Booking.count" do
      post :create, booking: {
        name: "Mikael Anka",
        phone_number: "070 123 45 87",
        number_of_persons: 4,
        starts_at: "2016-09-20 15:00:00 +0100",
        restaurant_id: restaurants(:one).id
      }
      assert_response :success
    end

    booking = assigns(:booking)
    assert_equal "pending", booking.state
    assert_equal "Mikael Anka", booking.name
    assert_equal "070 123 45 87", booking.phone_number
    assert_equal 4, booking.number_of_persons
    assert_equal "2016-09-20 15:00:00 +0100".to_time, booking.starts_at
  end
end
