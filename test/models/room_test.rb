require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "factory_girl" do
    room = FactoryGirl.create(:room)
    assert_equal 1, room.no
    assert_equal 9, room.max_user
    assert_nil room.pass
  end
end
