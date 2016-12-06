require_relative "../graph_builder"

describe "#graph_builder" do
  describe "#build_graph" do
    it "builds a graph given a csv file" do
      expected_graph = {
        "A"=>{:line=>["1", "2"], :connects=>["B", "D"]},
        "B"=>{:line=>["1"], :connects=>["A", "C"]},
        "C"=>{:line=>["1"], :connects=>["B", "E"]},
        "E"=>{:line=>["1", "2"], :connects=>["C", "F", "D"]},
        "F"=>{:line=>["1", "2"], :connects=>["E"]},
        "D"=>{:line=>["2"], :connects=>["A", "E"]}
      }

      graph = GraphBuilder.new().build_graph(
        "spec/test_file.csv",
        { headers: true, skip_blanks: true, skip_lines: "#"}
      )

      expect(graph).to eq expected_graph
    end
  end
end
