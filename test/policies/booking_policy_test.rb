require 'test_helper'

class BookingPolicyTest < ActiveSupport::TestCase
  def test_create_can_be_done_by_nil_user
    assert BookingPolicy.new(nil, Booking.new).create?
  end
end
