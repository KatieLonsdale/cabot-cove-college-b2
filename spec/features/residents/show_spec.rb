require 'rails_helper'

RSpec.describe 'residents show page' do
  before :each do
    @resident_1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
    @resident_2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
    @course_1 = @resident_1.courses.create!(name: "Crime Scenes 101")
    @course_2 = @resident_1.courses.create!(name: "Fingerprinting")
    @course_3 = @resident_2.courses.create!(name: "Math")
    @course_4 = @resident_2.courses.create!(name: "Science")
  end
  describe "As a visitor, when I visit '/courses'" do
    it "displays the resident's name and their courses" do
      visit "/residents/#{@resident_1.id}"
      within("#resident") do
        expect(page).to have_content(@resident_1.name)
        expect(page).to have_no_content(@resident_2.name)
      end
      within("#courses") do
        expect(page).to have_content(@course_1.name)
        expect(page).to have_content(@course_2.name)
        expect(page).to have_no_content(@course_3.name)
        expect(page).to have_no_content(@course_4.name)
      end

      visit "/residents/#{@resident_2.id}"
      within("#resident") do
        expect(page).to have_no_content(@resident_1.name)
        expect(page).to have_content(@resident_2.name)
      end
      within("#courses") do
        expect(page).to have_no_content(@course_1.name)
        expect(page).to have_no_content(@course_2.name)
        expect(page).to have_content(@course_3.name)
        expect(page).to have_content(@course_4.name)
      end
    end
  end
end