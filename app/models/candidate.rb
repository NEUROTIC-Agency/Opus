class Candidate < ApplicationRecord
  attr_accessor :is_dummy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes
  has_many :job_applications, dependent: :destroy
  has_one_attached :avatar
  belongs_to :recruitment_company
  after_create :set_tenant_id
  validates :email, :first_name, :last_name, :gender, :phone, :dob, :location, :nationality, :bio, :title, :linkedin, presence: true
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
    update(tenant_id: recruitment_company_id)
  end

  def check_if_tenant_id_changed
    unless tenant_id_was.nil?
      errors.add(:tenant_id, "Can't change tenant_id") if tenant_id_changed?
    end
  end
end
