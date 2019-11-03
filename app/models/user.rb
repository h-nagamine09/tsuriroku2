class User < ApplicationRecord
  has_secure_password
  before_save {self.email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
  　　　　　　　　　　　format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, #メールアドレスの正規表現
  　　　　　　　　　　　uniqueness: {case_sensitive: false} #重複を許さない。大文字小文字を区別しない
end
