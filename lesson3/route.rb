class Route
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station) 
  end
  
  def del_station(station)
    @stations.delete(station)
  end
  
  def stations
    return @stations
  end
end
