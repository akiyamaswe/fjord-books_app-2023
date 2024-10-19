# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validate :verify_file_type

  private

  def verify_file_type
    return unless avatar.attached?

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]
    errors.add(:avatar, :invalid_file_type) unless allowed_file_types.include?(avatar.blob.content_type)
  end
end
