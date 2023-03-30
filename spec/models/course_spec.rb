require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe '#instance methods' do
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
    end
    describe '#number_enrolled' do
      it 'returns number of residents enrolled in class' do
        expect(@course_1.number_enrolled).to eq(2)
        expect(@course_2.number_enrolled).to eq(1)
        expect(@course_3.number_enrolled).to eq(2)
        expect(@course_4.number_enrolled).to eq(1)
      end
    end
  end

end
