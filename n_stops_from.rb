require "./graph_builder.rb"
require "./stop_finder.rb"
require "./stop_renderer.rb"

station_csv_path, from_station_name, number_of_stops = ARGV[0], ARGV[1], ARGV[2]

stations_graph = GraphBuilder.new().build_graph(station_csv_path)

nth_stops = StopFinder.new(stations_graph).
  find_nth_stop_from(ARGV[1], ARGV[2].to_i)

StopRenderer.render_stops(nth_stops)
