require 'rails_helper'

RSpec.describe 'Users', type: :system do
  context '未ログイン状態' do
    describe 'アカウント登録' do
      let(:user_build) { build(:user) }
      it 'アカウント登録できる' do
        visit root_path
        click_link 'nav_sign_up'
        fill_in 'user[name]', with: user_build.name
        fill_in 'user[email]', with: user_build.email
        fill_in 'user[password]', with: user_build.password
        fill_in 'user[password_confirmation]', with: user_build.password
        expect { click_button 'アカウント登録' }.to change { User.count }.by(1)
      end
    end

    describe 'ログイン' do
      let(:user) { create(:user) }
      it 'ログインできる' do
        visit root_path
        click_link 'nav_login'
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button :commit
        expect(page).to have_selector '#nav_logout'
      end
    end
  end

  context 'ログイン状態' do
    let(:user) { create(:user) }
    before do
      sign_in user
      visit root_path
    end

    describe 'session' do
      it 'ログアウトできる' do
        click_link 'nav_logout'
        expect(page).to have_selector '#nav_login'
        expect(page).to_not have_selector '#nav_logout'
      end
    end

    describe 'ユーザー情報を変更' do
      context 'パスワードは変更しない' do
        it '更新できる' do
          click_link 'nav_edit_user'
          fill_in 'user[name]', with: 'ユーザー名を変更'
          fill_in 'user[email]', with: 'change@example.com'
          fill_in 'user[current_password]', with: user.password
          click_button '更新'
          user.reload
          expect(user.name).to eq 'ユーザー名を変更'
          expect(user.email).to eq 'change@example.com'
        end
      end
      context 'パスワードを変更する' do
        it '更新できる' do
          click_link 'nav_edit_user'
          fill_in 'user[current_password]', with: user.password
          fill_in 'user[password]', with: 'change_password'
          fill_in 'user[password_confirmation]', with: 'change_password'
          click_button '更新'
          user.reload
          expect(user.valid_password?('change_password')).to be true
        end
        context 'パスワードが一致しない' do
          it '変更されない' do
            click_link 'nav_edit_user'
            fill_in 'user[current_password]', with: user.password
            fill_in 'user[password]', with: 'change_password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button '更新'
            user.reload
            expect(user.valid_password?('change_password')).to be false
          end
        end
      end
    end
  end
end
