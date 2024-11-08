# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    assert_text 'ログインしました。'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報の一覧'
  end

  test 'visiting the report' do
    visit report_url(@report)
    assert_selector 'h1', text: '日報の詳細'
  end

  test 'creating a report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: '今日の昼ごはん'
    fill_in '内容', with: 'ハンバーグ'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日の昼ごはん'
    assert_text 'ハンバーグ'
  end

  test 'updating the report' do
    visit report_url(@report)
    click_on 'この日報を編集'

    fill_in 'タイトル', with: '私の名前は'
    fill_in '内容', with: 'アリスだよ'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '私の名前は'
    assert_text 'アリスだよ'
  end

  test 'should destroy the report' do
    visit report_url(@report)
    click_on 'この日報を削除'

    assert_text '日報が削除されました'
  end
end
