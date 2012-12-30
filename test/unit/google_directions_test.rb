require 'test_helper'

class GoogleDirectionsTest < Test::Unit::TestCase

  def test_the_truth
    assert true
  end
  
  def test_happy_case
    directions = GoogleDirections.new("121 Gordonsville Highway, 37030", "499 Gordonsville Highway, 38563")
    assert_equal(5928, directions.distance)
    assert_equal(3.681484517643552, directions.distance_in_miles)
    assert_equal(5.928, directions.distance_in_km)
    assert_equal(6, directions.drive_time_in_minutes)
    assert_equal("http://maps.google.com/maps/api/directions/xml?sensor=false&origin=121%20Gordonsville%20Highway,%2037030&destination=499%20Gordonsville%20Highway,%2038563", directions.xml_call)
    assert_not_nil(directions.xml =~ /36\.1772300/)
  end
  
  def test_directions_not_found
    directions = GoogleDirections.new("fasfefasdfdfsd", "499 Gordonsville Highway, 38563")
    assert_equal(0, directions.distance_in_miles)
    assert_equal(0, directions.drive_time_in_minutes)
    assert_equal("NOT_FOUND", directions.status)
  end
  
  def test_zero_results
    directions = GoogleDirections.new("Eiffel Tower, Paris", "499 Gordonsville Highway, 38563")
    assert_equal(0, directions.distance_in_miles)
    assert_equal(0, directions.drive_time_in_minutes)
    assert_equal("ZERO_RESULTS", directions.status)
  end
  
  
end
