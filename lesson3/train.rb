class Train

  attr_reader :number, :type, :wagons, :speed, :route, :cur_station

  def initialize(number, type, wagons = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_wagons
    if @speed == 0
      @wagons += 1
    end
  end

  def delete_wagons
    if @speed == 0
      @wagons -= 1
    end
  end

  def speedup(up)
    @speed += up
  end

  def stop
    @speed = 0
  end

  def route=(value)
    @route = value
    @cur_station = @route.stations[0]
    @cur_station.accept_train(self)
  end

  def step_forward
    index = @route.stations.index(@cur_station)
    if index != nil
      if @cur_station != nil
          @cur_station.dep_train(self)
      end
      @cur_station = @route.stations[index + 1]
      if @cur_station != nil
        @cur_station.accept_train(self)
      end
    end
  end
  
  def step_back
  index = @route.stations.index(@cur_station)
    if index != nil
      if @cur_station != nil
          @cur_station.dep_train(self)
      end
      @cur_station = @route.stations[index - 1]
      if @cur_station != nil
        @cur_station.accept_train(self)
      end
    end
  end

 def forward_station
    if @route == nil
      return nil
    end
    stations = @route.stations
    index = stations.index(@cur_station)
    return index == nil ? nil : stations[index + 1]
  end
  
 def back_station
    if @route == nil
      return nil
    end
    stations = @route.stations
    index = stations.index(@cur_station)
    return index == nil ? nil : stations[index - 1]
  end
end
