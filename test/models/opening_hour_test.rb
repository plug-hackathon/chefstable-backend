require 'test_helper'

class OpeningHourTest < ActiveSupport::TestCase
  
  def test_valid_from_time
  	openinghour = OpeningHour.new
    openinghour.week_day = 0
  	openinghour.from_time = "18:00"
  	openinghour.to_time = "22:00"
  	assert openinghour.valid?

  	openinghour.from_time = "fb:kk"
  	refute openinghour.valid? 
  	assert_includes openinghour.errors.keys, :from_time
  end

  def test_valid_to_time 
  	openinghour = OpeningHour.new
    openinghour.week_day = 1
  	openinghour.from_time = "18:00"
  	openinghour.to_time = "22:00"
  	assert openinghour.valid?

  	openinghour.to_time = "fb:kk"
  	refute openinghour.valid? 
  	assert_includes openinghour.errors.keys, :to_time
  end
  
end
