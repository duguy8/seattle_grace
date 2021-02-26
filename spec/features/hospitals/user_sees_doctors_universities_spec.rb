require "rails_helper"

RSpec.describe "When I visit a hospital's show page" do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor1 = @hospital.doctors.create!(
      name: "Meredith Grey",
      specialty: "General Surgery",
      university: "Harvard University"
    )
    @doctor2 = @hospital.doctors.create!(
      name: "Alex Karev",
      specialty: "Pediatric Surgery",
      university: "John Hopkins University"
    )
    @doctor3 = @hospital.doctors.create!(
      name: "Miranda Bailey",
      specialty: "General Surgery",
      university: "Harvard University"
    )
    @doctor4 = @hospital.doctors.create!(
      name: "Derek McDreamy Shepherd",
      specialty: "Attending Surgeon",
      university: "University of Pennsylvania"
    )
  end
  describe "I see all the hospitals information" do
    it "I see the name, and number of doctors that work here" do

      visit hospital_path(@hospital)

      expect(page).to have_content(@hospital.name)
      expect(page).to have_content("Number of Doctors: 4")
    end

    it "Shows unique list of universities of hospitals doctors" do

      visit hospital_path(@hospital)

      within(".universities") do
        expect(page).to have_content(@doctor1.university)
        expect(page).to have_content(@doctor2.university)
        expect(page).to have_content(@doctor4.university)
      end
    end
  end
end
