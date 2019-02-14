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
    @trains.count {|train| train.type == 'freight'}
  end

  def passenger_trains
    @trains.count {|train| train.type == 'passenger'}
  end
end
