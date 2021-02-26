class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(
      doctor_id: params[:format],
      patient_id: params[:id]
    )
    doctor_patient.destroy
    redirect_to doctor_path(params[:format])
  end
end
