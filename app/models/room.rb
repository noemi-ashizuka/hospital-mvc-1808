class Room
  attr_reader :patients, :capacity
  attr_accessor :id

  class CapacityReachedError < StandardError; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] # array on patient instances
  end

  def full?
    @patients.length == @capacity
  end

  def add_patient(patient)
    # raise StandardError, "Room is full" if full?
    raise CapacityReachedError, "Room is full" if full?
    patient.room = self
    @patients << patient 
  end
end
