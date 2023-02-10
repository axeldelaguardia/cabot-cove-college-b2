require 'rails_helper'

RSpec.describe ResidentCourses, type: :model do

  describe 'relationships' do
    it {should belong_to :resident}
    it {should belong_to :course}
  end

	describe '#average_age' do
		let!(:joe) { Resident.create!(name: 'Joe', age: 23, occupation: 'Dev')}
		let!(:max) { Resident.create!(name: 'Max Power', age: 28, occupation: 'Villian')}
		
		it 'returns average of all residents' do
			expect(Resident.average_age).to eq(25)
		end
	end

end
