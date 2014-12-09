class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  #need help with the syntax
  # scope :visible_to, -> { (user.admin? || user.premium?) ? all : where(private: false)}
  # scope :visible_to, -> (user) { user ? all : where(public: true) }
end
