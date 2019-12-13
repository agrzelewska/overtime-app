class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :audit_logs

  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  validates_presence_of :first_name, :last_name, :phone, :ssn, :company

  PHONE_REGEX = /\d/

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 9 }

  validates :ssn, length: { is: 4 }

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
