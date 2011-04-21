class Statement < ActiveRecord::Base
  has_many :votes
  has_many :users, :through => :votes

  validates_presence_of :text
  validates_uniqueness_of :text
end
