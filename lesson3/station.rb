class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    @trains << train
  end

  def dep_train(train)
    @trains.delete(train)
  end

  def freight_trains
    return @trains.select {|train| train.type == 'freight'}.count
  end

  def passenger_trains
    return @trains.select {|train| train.type == 'passenger'}.count
  end
end
