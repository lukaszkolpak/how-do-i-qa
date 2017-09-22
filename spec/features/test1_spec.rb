require 'rails_helper'

describe "check if the Next button works", js: true do

  before do
    visit '/pages/test_1'
  end

  it "clicks the button and check if the content matches" do
    within(".text-right") do
      click_on 'Next'
    end
    expect(page).to have_content 'Test #2'
  end
end