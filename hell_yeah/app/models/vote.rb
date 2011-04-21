class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :statement

  validates_uniqueness_of :user_id, :scope => :statement_id
end
