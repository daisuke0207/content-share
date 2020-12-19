# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    it 'ログイン状態で、正しく入力されていればで投稿できること' do
      expect(@post).to be_valid
    end

    it 'タイトルが空だと投稿できなこと' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end

    it '投稿内容が空だと投稿できなこと' do
      @post.body = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Body can't be blank")
    end

    it 'is_publish(公開設定)がtrueかfalseであれば投稿できること' do
      expect(@post.is_publish).to be_in([true, false])
    end

    it 'is_publish(公開設定)がtrueかfalseでなければ投稿できないこと' do
      @post.is_publish = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Is publish is not included in the list")
    end

    it 'userログイン状態でないと登録できないこと' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('User must exist')
    end
  end
end
