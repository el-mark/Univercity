class Opportunity < ActiveRecord::Base
  belongs_to :user
  has_many :opportunity_tags
  has_many :tags, through: :opportunity_tags
end
