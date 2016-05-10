require "rails_helper"
require 'capybara/rspec'

feature "smoke test" do
  describe 'should display the title' do
    scenario 'visits home page' do
      Capybara.current_driver = :selenium
      Capybara.app_host = 'http://tcc-lucas.herokuapp.com'
      visit('/')
      expect(page).to have_title 'Tcc'
    end
  end
end