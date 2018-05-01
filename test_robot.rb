require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true
    # act
    actual_value = robot.station
    # assert
    expected_value = 1

    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    # act
    actual_value = robot.station
    # assert
    expected_value = 2

    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    # act
    actual_value = robot.station
    # assert
    expected_value = 3

    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    # arrange
    robot = Robot.new
    # act
    actual_value = 4
    # assert
    expected_value = robot.station

    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    robot = Robot.new
    # act
    actual_value = robot.prioritize_tasks
    # assert
    expected_value = -1

    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    robot = Robot.new
    robot.todos = ['recharge', 'drive']
    # act
    actual_result = robot.prioritize_tasks
    # assert
    expected_result = 'recharge'

    assert_equal(expected_result, actual_result)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = 3
    # act
    actual_result = robot.workday?(3)
    # assert
    expected_result = false

    assert_equal(expected_result, actual_result)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = 3
    # act
    actual_result = robot.workday?(2)
    # assert
    expected_result = true

    assert_equal(expected_result, actual_result)
  end

end
