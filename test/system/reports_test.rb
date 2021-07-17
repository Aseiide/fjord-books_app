# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:test_report)

    visit root_path
    fill_in "Eメール", with: "alice@example.com"
    fill_in "パスワード", with: "password"
    click_on "ログイン"
  end

  test 'visiting the reports#index' do
    click_on "日報"
    assert_selector 'h1', text: '日報'
  end

  test "visiting the reports#show " do
    click_on "日報"
    click_on "詳細"
    assert_selector 'h1', text: '日報の詳細'
  end

  test 'creating a Report' do
  visit reports_path
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'Railsでテストを書く'
    assert_text 'システムテストを書いた'
  end

  test 'updating a Report' do
    click_on '日報'
    click_on "編集"

    fill_in "タイトル", with: @report.title
    fill_in '内容', with: @report.content

    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'Railsでテストを書く'
    assert_text 'システムテストを書いた'

    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text "Railsでテストを書く"
    assert_no_text "システムテストを書いた"
  end
end
