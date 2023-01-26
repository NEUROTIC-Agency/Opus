class RecruitmentCompany < ApplicationRecord
  attr_accessor :is_dummy
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :jobs, dependent: :destroy
  has_many :recruiters, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :tickets, through: :recruiters, dependent: :destroy
  has_many :job_applications, through: :recruiters, dependent: :destroy
  has_one_attached :avatar
  validates :name, :employees_count, :website, :location, :currency, :slug, presence: true
  after_create :set_tenant_id
  validates_presence_of :tenant_id, on: :update
  validate :check_if_tenant_id_changed, on: :update
  after_commit :set_avatar, on: [:create, :update]

  private
  def set_avatar
    unless avatar.attached? || is_dummy
      image = File.open(Rails.root.join("app", "assets", "images", "avatar.png"))
      avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
    end
  end

  def set_tenant_id
    update(tenant_id: id)
  end

  def check_if_tenant_id_changed
    unless tenant_id_was.nil?
      errors.add(:tenant_id, "Can't change tenant_id") if tenant_id_changed?
    end
  end
end
