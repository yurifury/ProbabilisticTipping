module TipHelper
  def explain(tip)
    name = link_to tip.user.name, tip.user
    rest = case tip.probability
    when 50 
      "a draw"
    when 1..49
      "#{100 - tip.probability}% for #{tip.match.competitor_1.name} to win"
    when 51..99
      "#{tip.probability}% for #{tip.match.competitor_2.name} to win"
    end
    name + " tipped #{rest}"
  end
end
