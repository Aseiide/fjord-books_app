# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable' do
    user = User.create!(email: 'user@example.com', password: 'password')
    report = Report.create!(user: user, title: '日報テスト', content: 'こんにちは')

    assert report.editable?(user)
  end

  test '#created_on' do
    user = build(:user)
    report = create(:report)

    assert report.created_on
    assert_not_equal report.created_at, report.created_on
  end
end
