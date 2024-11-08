# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should return email when name empty' do
    user = User.new(email: 'akiyama@example.com', name: '')
    assert_equal 'akiyama@example.com', user.name_or_email

    user.name = 'akiyama'
    assert_equal 'akiyama', user.name_or_email
  end
end
