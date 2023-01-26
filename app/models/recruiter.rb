class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :recruitment_company
  has_many :notes, dependent: :destroy
  has_many :jobs
  has_many :job_applications
  has_many :tickets, dependent: :destroy
  has_one_attached :avatar
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
