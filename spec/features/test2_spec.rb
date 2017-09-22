require 'rails_helper'

describe "Performs test #2", js: true do

  before do
    visit '/pages/test_2'
  end

  it "Checks if the correct message is displayed before submission" do
    expect(page).to have_content 'Data will appear here after submission.'
  end

  it "Checks if the error message is displayed correctly" do
    click_on 'Submit'
    expect(page).to have_content 'Some data was missing'
  end

  it "Fills out the form and checks for success message", aggregate_failures: true do
    fill_in('example_textfield', with: 'Test')
    check('example_checkbox')
    select('Opt 2', from: 'example_select')
    choose 'example_radiobutton_opt_1'
    save_and_open_screenshot
    click_on 'Submit'
    expect(page).to have_content 'Submitted successfully'
  end
end
