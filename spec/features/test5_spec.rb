require 'rails_helper'
require 'spec_helper'

describe "Performs test #5" do
  let!(:user) { create(:user) }

  before do
    visit '/pages/test_5'
  end

  it 'Fills in the user info and checks if it was accepted' do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    save_and_open_page
    expect(page).to have_content user.email
  end
end
