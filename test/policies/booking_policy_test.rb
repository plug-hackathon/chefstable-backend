require 'test_helper'

describe BookingPolicyTest do
  describe "create" do
    it "is allowed by a nil user" do
      assert BookingPolicy.new(nil, Booking.new).create?
    end
  end
end

class BookingPolicyTest < ActiveSupport::TestCase

  def test_scope
  end

  def test_show
  end

  def test_create

  end

  def test_update
  end

  def test_destroy
  end
end
