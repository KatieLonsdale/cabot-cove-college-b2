require 'rails_helper'

RSpec.describe 'courses index page' do
  describe "As a visitor, when I visit '/courses'" do
    before :each do
      @resident_1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      @resident_2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      @resident_3 = Resident.create!(name: "Steve", age: 50, occupation: "Librarian")
      @course_1 = @resident_1.courses.create!(name: "Crime Scenes 101")
      @course_2 = @resident_1.courses.create!(name: "Fingerprinting")
      @course_3 = @resident_2.courses.create!(name: "Math")
      @course_4 = @resident_2.courses.create!(name: "Science")
      @steve_math = ResidentCourse.create!(resident: @resident_3, course: @course_3)
      @steve_crime = ResidentCourse.create!(resident: @resident_3, course: @course_1)
      visit '/courses'
    end
    it "shows me a list of courses and the number enrolled in each" do
      within("#course") do
        expect(page).to have_content("#{@course_1.name}: #{@course_1.number_enrolled}")
        expect(page).to have_content("#{@course_2.name}: #{@course_2.number_enrolled}")
        expect(page).to have_content("#{@course_3.name}: #{@course_3.number_enrolled}")
        expect(page).to have_content("#{@course_4.name}: #{@course_4.number_enrolled}")
      end
    end
  end
end