require 'spec_helper'

describe 'User' do
  let(:user){Fabricate(:user)}
  context 'main page' do
    it 'has a link to signup' do
      visit root_path
      page.should have_link('Signup')
    end

    it 'has a link to login' do
      visit root_path
      page.should have_link('Login')
    end
  end

  context 'logging in' do
    before(:each) {visit login_path}

    it 'redirects to login when unauthenticated' do
      visit user_path(user)
      current_path.should == login_path
    end

    it 'has an email field' do
      page.should have_field('email')
    end

    it 'has a password field' do
      page.should have_field('password')
    end

    it 'has a signup button for lost users ' do
      page.should have_link('Signup')
    end

    it 'shows an error when fields are blank' do
      click_button('Login')
      page.should have_content('Incorrect credentials')
    end

    it 'shows an error with bogus input' do
      fill_in 'email', with: 'iof;ihf;flnaafln'
      fill_in 'password', with: 'iofdasfddd2342fln'
      click_button('Login')
      page.should have_content('Incorrect credentials')
    end

    it 'user#show accessable on success' do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button('Login')
      visit user_path(user)
      current_path.should == user_path(user)
    end
  end

  context 'signing up' do
    before(:each) {visit login_path}

    it 'has an email field' do
      page.should have_field('email')
    end

    it 'has a password field' do
      page.should have_field('password')
    end

    it 'has a password confirmation field' do
      page.should have_field('password')
    end
  end
end