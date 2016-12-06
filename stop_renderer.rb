class StopRenderer
  class << self
    def render_stops(stops_hash)
      sorted_hash = Hash[stops_hash.sort]
      sorted_hash.each do |station, lines|
        puts "#{station} (lines = #{lines.join(', ')})"
      end
    end
  end
end
