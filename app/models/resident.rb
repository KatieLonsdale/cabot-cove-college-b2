class Resident < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :occupation

  has_many :resident_courses
  has_many :courses, through: :resident_courses

  def list_courses
    courses = ResidentCourse.select(:course_id).where(resident_id: id)
    Course.where(id: courses)
  end
end
