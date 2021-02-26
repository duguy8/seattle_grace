require "rails_helper"

RSpec.describe "When I visit a doctor's show page" do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor = @hospital.doctors.create!(
      name: "Meredith Grey",
      specialty: "General Surgery",
      university: "Harvard University"
    )
    @patient1 = @doctor.patients.create!(
      name: "Katie Bryce",
      age: 24
    )
    @patient2 = @doctor.patients.create!(
      name: "Denny Duquette",
      age: 39
    )
    @patient3 = @doctor.patients.create!(
      name: "Rebecca Pope",
      age: 32
    )
    @patient4 = @doctor.patients.create!(
      name: "Zola Shepherd",
      age: 2
    )
  end
  describe "I see all the doctors information" do
    it "Shows name, specialty and university for doctor" do

      visit doctor_path(@doctor)

      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)
    end
    it "I see name of hospital where doctor works" do

      visit doctor_path(@doctor)

      expect(page).to have_content(@hospital.name)
    end
    it "See names of all patients of this doctor" do

      visit doctor_path(@doctor)

      within(".patients") do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient4.name)
      end
    end
  end
end
