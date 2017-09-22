require 'rails_helper'

describe "Performs test #4", js: true do

  before do
    visit '/pages/test_4'
  end

  it "Checks if the text changes after clicking a button" do
    expect(page).to have_content 'Text of this element should change after call completes.'
    click_on 'Click me to fire an AJAX call'
    expect(page).to have_content 'This is answer from the server'
  end
end
