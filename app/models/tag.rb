class Tag < ActiveRecord::Base
  has_many :opportunity_tags
  has_many :opportunities, through: :opportunity_tags
end
