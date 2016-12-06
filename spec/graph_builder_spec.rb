require_relative "../graph_builder"
require_relative "./spec_helper"

describe "#graph_builder" do
  RSpec.configure do |c|
    c.include SpecHelper
  end

  describe "#build_graph" do
    it "builds a graph given a csv file" do
      expected_graph = test_graph

      graph = GraphBuilder.new().build_graph(
        "spec/test_file.csv",
        { headers: true, skip_blanks: true, skip_lines: "#"}
      )

      expect(graph).to eq expected_graph
    end
  end
end
