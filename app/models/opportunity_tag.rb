class OpportunityTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :opportunity
end
