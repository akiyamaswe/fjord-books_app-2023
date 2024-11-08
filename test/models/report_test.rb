# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'editable?' do
    alice = users(:alice)
    bob = users(:bob)
    alice_report = reports(:alice_report)
    assert alice_report.editable?(alice)
    assert_not alice_report.editable?(bob)
  end
end
