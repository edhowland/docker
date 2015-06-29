# patient_info.rb - model class PatientInfo

class PatientInfo
  include Fieldable

  def initialize arr
    @patient_name = arr[0]
  @date_of_birth = arr[1]
    @mrn = arr[2]
    @gender = arr[3]
    @referring_physician = arr[4]
    @referring_pathologist = arr[5]
    @accession_number = arr[6]
    @specimen_type = arr[7]
    @tissue_type = arr[8]
    @indication = arr[9]
    @date_collected = arr[10]
    @date_ordered = arr[11]

  end

  attr_reader :patient_name
  attr_reader :date_of_birth
  attr_reader :mrn
    attr_reader :gender
    attr_reader :referring_physician
    attr_reader :referring_pathologist
  attr_reader :accession_number
  attr_reader :specimen_type
  attr_reader :tissue_type
  attr_reader :indication
  attr_reader :date_collected
  attr_reader :date_ordered

end
