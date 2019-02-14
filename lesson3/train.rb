class Train

  attr_reader :number, :type, :wagons, :speed, :route, :current_station

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
    @current_station = @route.stations.first
    @current_station.accept_train(self)
  end

  def step_forward
    index = @route.stations.index(@current_station)
    if index
      if @current_station
          @current_station.dep_train(self)
      end
      @current_station = @route.stations[index + 1]
      if @current_station
        @current_station.accept_train(self)
      end
    end
  end
  
  def step_back
  index = @route.stations.index(@current_station)
    if index
      if @current_station
          @current_station.dep_train(self)
      end
      @current_station = @route.stations[index - 1]
      if @current_station
        @current_station.accept_train(self)
      end
    end
  end

  def forward_station
    if !@route
      stations = @route.stations
      index = stations.index(@current_station)
      index == nil ? nil : stations[index + 1]
    end
  end
  
  def back_station
    if !@route
      stations = @route.stations
      index = stations.index(@current_station)
      index == nil ? nil : stations[index - 1]
    end
  end
end
