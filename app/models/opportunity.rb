class Opportunity < ActiveRecord::Base
  belongs_to :user
  has_many :opportunity_tags
  has_many :tags, through: :opportunity_tags
  has_attached_file :pic, default_url: ""

  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
  validates :title, :description, :opportunity_type, :startdate, :duration, :location,  presence: true
  validates :title, :uniqueness => true


  def self.search(search)
    s = "%#{search}%"
    Opportunity.where("title LIKE ? or description LIKE ? or location LIKE ?", s, s, s)
  end
  # def self.search(search)
  #   @s = "%#{search}%"
  #   @user = User.find_by("name LIKE ?", @s)
  #   where("title LIKE ? or description LIKE ? or user_id = ?", @s, @s, @user.id)
  # end
  # def self.search(search)
  #   s = "%#{search}%"
  #
  #   Opportunity.joins(:user).where("users.name LIKE ?", s)
  # end

  # def self.search(search)
  #   s = "%#{search}%"
  #   titles_and_descriptons = Opportunity.where("title LIKE ? or description LIKE ?", s, s)
  #   organizations = Opportunity.joins(:user).where("users.name LIKE ?", s)
  #   titles_and_descriptons + organizations
  # end

  # def self.search(search)
  #   s = "%#{search}%"
  #   Opportunity.where("title LIKE ? or description LIKE ?", s, s).or.joins(:user).where("users.name LIKE ?", s)
  # end
end
