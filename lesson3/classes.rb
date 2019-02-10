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

  def trains_by_type
    res = {Train::FREIGHT_TYPE => 0, Train::PASSENGER_TYPE => 0}
    @trains.each { |train| res[train.type] += 1 }
    return res
  end
end

class Route
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @station_list = []
  end

  def add_station(station)
      @station_list << station
  end

  def del_station(station)
    @station_list.delete(station)
  end

  def stations
    return [@first_station , *@station_list, @last_station]
  end
end

class Train
  FREIGHT_TYPE = 'freight_train'
  PASSENGER_TYPE = 'passenger_train'

  attr_reader :number, :type, :wagons, :speed, :route

  def initialize(number, type, wagons = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @cur_station = NIL
  end

  def update_wagons(add=true)
    if @speed == 0
      @wagons += (add ? 1 : -1)
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

  def move_to_next_station(forward=true)
    index = @route.stations.index(@cur_station)
    if index != NIL
      if @cur_station != NIL
          @cur_station.dep_train(self)
        end
      @cur_station = @route.stations[index + (forward ? 1 : -1)]
      if @cur_station != NIL
        @cur_station.accept_train(self)
      end
    end
  end

  def stations
    if @route == NIL
      return [NIL, NIL, NIL]
    end
    stations = @route.stations
    index = stations.index(@cur_station)
    return index == NIL ? [NIL, NIL, NIL] : [stations[index - 1], stations[index], stations[index + 1]]
  end
end

st1, st2, st3 = Station.new('st1'), Station.new('st1'), Station.new('st3')
r = Route.new(st1, st3)
t1, t2 = Train.new('1', Train::PASSENGER_TYPE), Train.new('1', Train::FREIGHT_TYPE)

puts st1.trains_by_type
puts r.stations

r.add_station(st2)
puts r.stations.size

r.del_station(st2)
puts r.stations.size
r.add_station(st2)

puts st1.trains.size
puts t1.route == NIL
puts t1.stations == [NIL, NIL, NIL]

t1.route = r
t2.route = r
puts st1.trains.size
puts t1.route != NIL
puts st1.trains_by_type

t1.speedup(10)
puts t1.speed
t1.update_wagons(true)
puts t1.wagons == 0
t1.stop
t1.update_wagons(true)
puts t1.wagons == 1

t1.move_to_next_station(true)
puts t1.stations[2] == st3
puts st1.trains_by_type
puts st2.trains_by_type
puts t2.stations.size

t1.move_to_next_station(false)
puts t1.stations[1] == st1
puts st1.trains_by_type
puts st2.trains_by_type
