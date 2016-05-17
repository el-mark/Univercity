class Opportunity < ActiveRecord::Base
  belongs_to :user
  has_many :opportunity_tags
  has_many :tags, through: :opportunity_tags
  has_attached_file :pic, default_url: ""
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
