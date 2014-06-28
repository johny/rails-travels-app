class Journey < ActiveRecord::Base

  DURATIONS = [
    ["Na jeden dzień", :single],
    ["Na weekend", :weekend],
    ["Tydzień", :one_week],
    ["Dwa tygodnie", :two_weeks],
    ["Miesiąc", :one_month],
    ["Dwa miesiące", :two_months],
    ["Pół roku", :half_year],
    ["Rok albo i dłużej", :year_or_more],
    ["Nieokreślone", :indefinite]
  ]


  # relations

  belongs_to :user


end
