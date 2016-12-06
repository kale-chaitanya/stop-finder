require_relative "../stop_finder"
require_relative "./spec_helper"

describe "#stop_finder" do
  RSpec.configure do |c|
    c.include SpecHelper
  end

  describe "#find_nth_stop_from" do
    context "n = 1" do
      context "station is only on one line" do
        it "returns immediate next stops" do
          expected_nth_stops =
            {"C"=>["1", "2"], "F"=>["1", "2"], "D"=>["1", "2"]}

          nth_stops = StopFinder.new(test_graph).
            find_nth_stop_from("E", 1)

          expect(nth_stops).to eq expected_nth_stops
        end
      end

      context "station is on two lines" do
        it "returns immediate next stops with all the lines travelled" do
          expected_nth_stops = {"C"=>["1"], "A"=>["1", "2"]}

          nth_stops = StopFinder.new(test_graph).
            find_nth_stop_from("B", 1)

          expect(nth_stops).to eq expected_nth_stops
        end
      end
    end

    context "n = 4" do
      it "returns immediate next stops" do
        expected_nth_stops = {"F"=>["1", "2"], "D"=>["1", "2"], "B"=>["1", "2"]}

        nth_stops = StopFinder.new(test_graph).
          find_nth_stop_from("A", 4)

        expect(nth_stops).to eq expected_nth_stops
      end
    end

    context "n = 500 (out of bounds)" do
      it "returns empty hash" do
        expected_nth_stops = {}

        nth_stops = StopFinder.new(test_graph).
          find_nth_stop_from("E", 500)

        expect(nth_stops).to eq expected_nth_stops
      end
    end
  end
end
