require 'rails_helper'

RSpec.describe "residents index page" do
  before :each do
    @resident_1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
    @resident_2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
    visit '/residents'
  end
  describe "as a visitor, when I visit '/residents'" do
    it "should show me a list of residents with their name, age, and occupation" do
      within("#resident") do
        expect(page).to have_content(@resident_1.name)
        expect(page).to have_content(@resident_1.age)
        expect(page).to have_content(@resident_1.occupation)

        expect(page).to have_content(@resident_2.name)
        expect(page).to have_content(@resident_2.age)
        expect(page).to have_content(@resident_2.occupation)
      end
    end
  end
end