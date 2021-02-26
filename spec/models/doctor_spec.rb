require "rails_helper"

RSpec.describe Doctor, type: :model do
  describe "Validations" do
    it { should validates_presence_of :name }
    it { should validates_presence_of :specialty }
    it { should validates_presence_of :university }
  end

  describe "Relationships" do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end
end
