require 'rails_helper'
require 'spec_helper'

describe "Performs test #6" do
  context 'No data' do
    it 'Checks if there is no data' do
      visit '/pages/test_6'
      expect(page).to have_content 'No data'
    end
  end

  context'Data present' do
    let!(:country) { create(:country) }
    before  do
      visit '/pages/test_6'
    end

    it 'Checks if the database is propagated' do
      expect(page).to have_content (country.name && ' | ' && country.code)
    end
  end
end
