require "rails_helper"

RSpec.describe "When I visit a patient's index page" do
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
  describe "I see all the patients names" do
    it "Should be listed oldest to youngest" do

      visit patients_path

      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      expect(page).to have_content(@patient4.name)

      expect(@patient2.name).to appear_before(@patient3.name)
      expect(@patient3.name).to appear_before(@patient1.name)
      expect(@patient1.name).to appear_before(@patient4.name)
    end
  end
end
