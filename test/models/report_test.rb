# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable' do
    user = build(:user)
    report = create(:report, user: user)

    assert report.editable?(user)
  end

  test '#created_on' do
    report = create(:report)

    assert report.created_on
    assert_not_equal report.created_at, report.created_on
  end
end
