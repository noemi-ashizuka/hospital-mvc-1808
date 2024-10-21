require_relative "app/models/patient.rb"
require_relative "app/models/room.rb"
require_relative "app/repositories/patient_repository.rb"

csv_file = "data/patients.csv"
repository = PatientRepository.new(csv_file)

# arisa = Patient.new("Arisa", false)
# arisa = Patient.new({name: "Arisa", cured: false})
# arisa = Patient.new(name: "Arisa")
# dylan = Patient.new(name: "Dylan")
# jarod = Patient.new(name: "Jarod")

# repository.create(jarod)
# p repository
# vip_room = Room.new(capacity: 2)
# big_room = Room.new(capacity: 8)


# vip_room.add_patient(arisa)
# vip_room.add_patient(dylan)
# # vip_room.add_patient(toby)
# # p arisa.cured?
# vip_room.patients.each do |patient|
#   puts patient.name
# end
# p arisa.room.capacity
