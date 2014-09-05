class Post < ActiveRecord::Base

  # relations

  belongs_to :user

  # scopes

  scope :active, -> { where("expires_at > ?", Date.yesterday.midnight)}

  # class methods



end
