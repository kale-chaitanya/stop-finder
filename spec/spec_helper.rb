module SpecHelper
  def test_graph
    {
      "A"=>{:line=>["1", "2"], :connects=>["B", "D"]},
      "B"=>{:line=>["1"], :connects=>["A", "C"]},
      "C"=>{:line=>["1"], :connects=>["B", "E"]},
      "E"=>{:line=>["1", "2"], :connects=>["C", "F", "D"]},
      "F"=>{:line=>["1", "2"], :connects=>["E"]},
      "D"=>{:line=>["2"], :connects=>["A", "E"]}
    }
  end
end
