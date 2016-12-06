class GraphBuilder
  require "csv"
  def initialize
    @graph = {}
  end

  def build_graph(relative_csv_path, options = { headers: true })
    CSV.foreach(relative_csv_path, options) do |row|
      populate_stations_lines_and_connections(row)
    end
    graph
  end

  private

  attr_accessor :graph

  def populate_stations_lines_and_connections(row)
    initialize_station(row[1])
    initialize_station(row[2])

    asssociate_line_with_station(row[1], row[0])
    asssociate_line_with_station(row[2], row[0])

    establish_connection_between_stations(row[1], row[2])
  end

  def initialize_station(station_name)
    if graph[station_name].nil?
      graph[station_name] = { "line": [], "connects": [] }
    end
  end

  def asssociate_line_with_station(station_name, line_name)
    unless graph[station_name][:line].include?(line_name)
      graph[station_name][:line] << line_name
    end
  end

  def establish_connection_between_stations(station_from, station_to)
    add_connection_to_station(station_from, station_to)
    add_connection_to_station(station_to, station_from)
  end

  def add_connection_to_station(from_station, to_station)
    unless graph[from_station][:connects].include?(to_station)
      graph[from_station][:connects] << to_station
    end
  end
end
