require "csv"

class PatientRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @patients = [] # patients instances
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # change all the strings into actual data
      # p row
      row[:id] = row[:id].to_i
                    # "false" == "true" => false
                    # "true" == "true" => true
      row[:cured] = row[:cured] == "true"
      p row[:room_id] = row[:room_id].to_i
      room = @room_repository.find(row[:room_id]) # returns an instance of a room
      # creates a new [:room] key in the row hash
      row[:room] = room # pass the room to the instance
      # p row
      patient = Patient.new(row)
      # p patient
      @patients << patient
      # p @next_id
    end
    # p @patients

    @next_id = @patients.any? ? @patients.last.id + 1 : @next_id
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "cured"]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
