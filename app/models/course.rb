class Course < ApplicationRecord
  validates_presence_of :name
  has_many :resident_courses
  has_many :residents, through: :resident_courses

  def number_enrolled
    ResidentCourse.select(:resident_id).where(course_id: id).size
  end
end
