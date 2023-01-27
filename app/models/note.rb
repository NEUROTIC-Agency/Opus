class Note < ApplicationRecord
  acts_as_tenant :company
  belongs_to :candidate
  belongs_to :recruiter
  validates :body, presence: true
end
