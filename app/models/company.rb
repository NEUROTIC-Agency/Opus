class Company < ApplicationRecord
  attr_accessor :is_dummy
  has_many :jobs, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  has_many :recruiters, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_one_attached :avatar
  validates :name, :employees_count, :website, :location, :currency, presence: true
  after_commit :set_avatar, on: [:create, :update]

  private
  def set_avatar
    unless avatar.attached? || is_dummy
      image = File.open(Rails.root.join("app", "assets", "images", "avatar.png"))
      avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
    end
  end
end
