class Job < ApplicationRecord
  belongs_to :recruitment_company
  belongs_to :recruiter, optional: true
  has_many :job_applications, dependent: :destroy
  has_many :candidates, through: :job_applications
  validates :title, :salary, :employment_type, :location, :role_description, :requirements, :benefits, :interview_process, presence: true
  after_create :set_tenant_id
  validates_presence_of :tenant_id, on: :update
  validate :check_if_tenant_id_changed, on: :update

  private
  def set_tenant_id
    update(tenant_id: recruitment_company_id)
  end

  def check_if_tenant_id_changed
    unless tenant_id_was.nil?
      errors.add(:tenant_id, "Can't change tenant_id") if tenant_id_changed?
    end
  end
end
