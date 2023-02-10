class Resident < ApplicationRecord
	has_many :resident_courses
	has_many :courses, through: :resident_courses
	validates :name, :age, :occupation, presence: true

	def self.average_age
		average(:age).to_f
	end
end
