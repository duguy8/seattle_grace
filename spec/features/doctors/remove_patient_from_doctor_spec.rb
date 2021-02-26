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
  describe "Theres a button to remove patient from doctor" do
    it "Brings me back to Doctor's show page" do

      visit doctor_path(@doctor)

      within("#patient-#{@patient2.id}") do
        expect(page).to have_button("Remove Patient")
        click_button "Remove Patient"
      end

      expect(page).not_to have_content(@patient2.name)
    end
  end
end
