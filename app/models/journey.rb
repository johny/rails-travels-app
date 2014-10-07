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

  # attributes

  has_attached_file :cover,
    :styles => {
      large: "1920x1280>",
      big: "960x640",
      medium: "640x426",
      small: "320x240" },
    :default_url => "/images/cover/:style_missing.png"

  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  # scopes

  scope :published, -> { all }

end
