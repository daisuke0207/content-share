require 'rails_helper'

RSpec.describe Post, type: :system do
  describe '一覧表示機能' do
    before do
      @post = FactoryBot.create(:post)
    end

    context 'postが公開設定のとき' do
      it 'is_publishがtrueのとき、postが表示されること' do
        @post.is_publish = true
        expect(page).to have_content('投稿タイトル')
        expect(page).to have_content('投稿内容')
        expect(page).to have_content(@post.user.nickname)
      end
    end

    context 'postが非公開設定のとき' do
      it 'is_publishがfalseのとき、postが表示されないこと' do
        @post.is_publish = false
        expect(page).to have_no_content('投稿タイトル')
        expect(page).to have_no_content('投稿内容')
        expect(page).to have_no_content(@post.user.nickname)
      end
    end
  end
end