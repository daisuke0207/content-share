require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it '正しく入力されていればでコメントできること' do
      expect(@comment).to be_valid
    end

    it 'コメントが空だとコメントできないこと' do
      @comment.body = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Body can't be blank")
    end

    it 'ユーザーが空だと投稿できなこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("User must exist")
    end

    it '投稿が空だと投稿できなこと' do
      @comment.post = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Post must exist")
    end
  end
end
