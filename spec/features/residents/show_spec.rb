require 'rails_helper'

describe Resident, type: :feature do
	let!(:joe) { Resident.create!(name: 'Joe', age: 23, occupation: 'Dev')}
	let!(:max) { Resident.create!(name: 'Max Power', age: 28, occupation: 'Villian')}
	let!(:weaving) { max.courses.create!(name: "Weaving")}
	let!(:fencing) { max.courses.create!(name: "Fencing")}
	
	describe 'User Story 2' do
		it 'shows the attributes of all resident' do
			visit "/residents/#{max.id}"

			save_and_open_page
			expect(page).to have_content(max.name)
			expect(page).to have_content("Courses")
			expect(page).to have_content("- #{weaving.name}")
			expect(page).to have_content("- #{fencing.name}")
		end
	end
end