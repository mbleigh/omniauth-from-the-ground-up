class User < ActiveRecord::Base
  has_many :votes
  has_many :statements, :through => :votes

  validates_uniqueness_of :screen_name

  def self.from_auth(auth)
    existing = User.find_by_screen_name(auth['user_info']['nickname'])
    existing || User.create(:name => auth['user_info']['name'], :screen_name => auth['user_info']['nickname'])
  end
end
