class StopFinder
  def initialize(graph)
    @graph = graph
  end

  def find_nth_stop_from(start_at_station, number_of_stops ,
      traversed = [], lines = [])
    traversed = traversed + [start_at_station]

    unless lines.include?(graph[start_at_station][:line])
      lines = lines + graph[start_at_station][:line]
    end

    if traversed.length ==  number_of_stops + 1
      return { traversed.last => lines.uniq }
    end

    stations_at_n_stops = {}

    for station in graph[start_at_station][:connects] do
      unless traversed.include?(station)
        newpath = find_nth_stop_from(station, number_of_stops, traversed, lines)
        stations_at_n_stops.update(newpath)
      end
    end

    stations_at_n_stops
  end

  private

  attr_reader :graph
end
