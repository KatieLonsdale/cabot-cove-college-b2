require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe '::class methods' do
    before :each do
      @resident_1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      @resident_2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      @resident_3 = Resident.create!(name: "Steve", age: 50, occupation: "Librarian")
    end
    describe '::average_age' do
      it 'returns the average age of all residents' do
        expect(Resident.average_age).to eq(61.7)
      end
    end
  end

  describe '#instance methods' do
    before :each do
      @resident_1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      @resident_2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      @course_1 = @resident_1.courses.create!(name: "Crime Scenes 101")
      @course_2 = @resident_1.courses.create!(name: "Fingerprinting")
      @course_3 = @resident_2.courses.create!(name: "Math")
      @course_4 = @resident_2.courses.create!(name: "Science")
    end
    describe '#list_courses' do
      it 'returns a list of courses the resident is enrolled in' do
        expect(@resident_1.list_courses).to eq([@course_1, @course_2])
        expect(@resident_2.list_courses).to eq([@course_3, @course_4])
      end
    end
  end


end
