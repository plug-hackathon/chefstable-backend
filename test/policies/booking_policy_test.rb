require 'test_helper'

class BookingPolicyTest < ActiveSupport::TestCase

  def test_scope
  end

  def test_show
  end

  def test_create
  end

  def test_create_can_be_done_by_nil_user
    assert BookingPolicy.new(nil, Booking.new).create?
  end

  def test_update
  end

  def test_destroy
  end
end
