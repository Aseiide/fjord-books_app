# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_path
    fill_in "Eメール", with: "alice@example.com"
    fill_in "パスワード", with: "password"
    click_on "ログイン"
  end

  test 'visiting the books#index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test "visiting the books#show" do
    click_on "詳細"
    assert_selector 'h1', text: '本の詳細'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'わかりやすい'
    fill_in '著者', with: '@igaiga'

    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'わかりやすい'
    assert_text '@igaiga'
    click_on '戻る'
  end

  test 'updating a Book' do
    click_on '編集'

    fill_in "タイトル", with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author

    click_on '更新する'

    assert_text '本が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
    assert_no_text "Ruby超入門"
    assert_no_text "わかりやすい"
    assert_no_text '@igaiga'
  end
end
