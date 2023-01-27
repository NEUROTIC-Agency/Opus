class JobApplication < ApplicationRecord
  acts_as_tenant :company
  belongs_to :candidate
  belongs_to :job
  belongs_to :recruiter, optional: true
end
