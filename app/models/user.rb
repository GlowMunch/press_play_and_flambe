class User < ApplicationRecord
  has_many :favorites
  before_create :generate_api_key
  has_secure_password

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
