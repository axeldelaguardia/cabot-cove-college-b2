require 'rails_helper'

describe Resident, type: :feature do
	let!(:joe) { Resident.create!(name: 'Joe', age: 23, occupation: 'Dev') }
	let!(:max) { Resident.create!(name: 'Max Power', age: 28, occupation: 'Villian') }
	
	describe 'User Story 1' do
		it 'shows the attributes of all residents' do
			visit '/residents'

			expect(page).to have_content(joe.name)
			expect(page).to have_content("Age: #{joe.age}")
			expect(page).to have_content("Occupation: #{joe.occupation}")
		end
	end

	describe 'User Story 4' do
		it 'shows the average age of all residents' do
			visit '/residents' 
			
			avg_age = Resident.average(:age).to_f
			expect(page).to have_content("Average Age: #{avg_age}")
		end
	end

	describe 'User Story 5' do
		it 'shows residents in alphabetical order' do
			visit '/residents'

			expect(page).to have_content()
		end
	end
end