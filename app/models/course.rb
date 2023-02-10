class Course < ApplicationRecord
	has_many :resident_courses
	has_many :residents, through: :resident_courses
	validates :name, presence: true

	def number_enrolled
		self.residents.count
	end
end
