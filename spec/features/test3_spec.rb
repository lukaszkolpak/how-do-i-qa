require 'rails_helper'

describe "Performs test #3", js: true do

  before do
    visit '/pages/test_3'
  end

  it "Checks if the table is highlighted after clicking" do
    first(:xpath, '//table//tr').click
    expect(page).to have_css('table tr.highlighted')
  end
end
