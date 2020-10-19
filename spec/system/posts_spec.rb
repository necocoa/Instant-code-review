require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  context '未ログインの時' do
    describe 'index' do
      it '表示される' do
        visit root_path
        click_link 'header_logo'
        expect(page).to have_content '投稿一覧'
      end
    end

    describe 'show' do
      let!(:post) { create(:post) }
      it '表示される' do
        visit root_path
        click_link 'header_logo'
        click_link post.title
        expect(page).to have_content post.title
        expect(page).to have_content post.body
      end
    end

    describe 'new' do
      it 'リダイレクトされる' do
        visit new_post_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end

  context 'ログインしている時' do
    let(:current_user) { create(:user) }
    before do
      sign_in current_user
      visit root_path
    end

    describe 'new' do
      let(:build_post) { build(:post) }
      it '投稿できる' do
        click_link 'header_new_post'
        fill_in 'post[title]', with: build_post.title
        fill_in 'post[body]', with: build_post.body
        expect { click_button :commit }.to change { Post.count }.by(1)
      end
    end

    describe 'destroy' do
      let(:current_post) { create(:post, user: current_user) }
      it '削除できる' do
        visit post_path(current_post)
        expect { click_link '削除' }.to change { Post.count }.by(-1)
      end
      context '他人のpostの時' do
        let(:other_post) { create(:post, user: create(:user)) }
        it '削除ボタンが表示されない' do
          visit post_path(other_post)
          expect(page).to_not have_content '削除'
        end
      end
    end
  end
end
