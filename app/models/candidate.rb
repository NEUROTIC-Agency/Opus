class Candidate < ApplicationRecord
  attr_accessor :is_dummy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_tenant :company
  has_one_attached :avatar
  has_many :job_applications, dependent: :destroy
  has_many :notes
  validates :email, :first_name, :last_name, :gender, :phone, :dob, :location, :nationality, :bio, :title, :linkedin, presence: true
  after_commit :set_avatar, on: [:create, :update]

  private
  def set_avatar
    unless avatar.attached? || is_dummy
      image = File.open(Rails.root.join("app", "assets", "images", "avatar.png"))
      avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
    end
  end
end
