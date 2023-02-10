require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

	describe '#resident_count' do
		let!(:joe) { Resident.create!(name: 'Joe', age: 23, occupation: 'Dev')}
		let!(:max) { Resident.create!(name: 'Max Power', age: 28, occupation: 'Villian')}
		let!(:weaving) { Course.create!(name: "Weaving")}
		let!(:fencing_1) { Course.create!(name: "Fencing")}
		
		before do
			ResidentCourse.create!(resident: joe, course: weaving)
			ResidentCourse.create!(resident: max, course: weaving)
		end

		it 'returns a count of residents enrolled in course' do
			expect(weaving.number_enrolled).to eq(2)
		end
	end

end
