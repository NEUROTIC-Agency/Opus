class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_tenant :company
  has_one_attached :avatar
  has_many :jobs
  has_many :job_applications
  has_many :notes, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
