class Job < ApplicationRecord
  acts_as_tenant :company
  belongs_to :recruiter, optional: true
  has_many :candidates, through: :job_applications
  has_many :job_applications, dependent: :destroy
  validates :title, :salary, :employment_type, :location, :role_description, :requirements, :benefits, :interview_process, presence: true
end
