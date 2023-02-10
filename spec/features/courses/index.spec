require 'rails_helper'

describe Course, type: :feature do
	let!(:joe) { Resident.create!(name: 'Joe', age: 23, occupation: 'Dev')}
	let!(:max) { Resident.create!(name: 'Max Power', age: 28, occupation: 'Villian')}
	let!(:weaving) { Course.create!(name: "Weaving")}
	let!(:fencing) { Course.create!(name: "Fencing")}

	before do
		ResidentCourse.create!(resident: max, course: weaving)
		ResidentCourse.create!(resident: joe, course: weaving)
		ResidentCourse.create!(resident: max, course: fencing)
	end

	describe 'User Story 3' do
		it 'shows a list of courses and amount of residents in course' do
			visit "/courses"

			save_and_open_page
			expect(page).to have_content("#{weaving.name}: #{weaving.number_enrolled}")
			expect(page).to have_content("#{fencing.name}: #{fencing.number_enrolled}")
		end
	end
end