class Ticket < ApplicationRecord
  acts_as_tenant :company
  belongs_to :recruiter
end
