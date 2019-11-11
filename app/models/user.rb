class User < ApplicationRecord
  has_secure_password
  before_save {self.email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, #メールアドレスの正規表現
            uniqueness: {case_sensitive: false} #重複を許さない。大文字小文字を区別しない
has_many :records ,dependent: :destroy
has_many :relationships,dependent: :destroy
has_many :followings, through: :relationships, source: :follow,dependent: :destoy
has_many :reverses_of_relationship, class_name: 'Relationship',foreign_key: 'follow_id', dependent: :destroy
has_many :followers, through: :reverses_of_relationship,source:b :user,dependent: :destroy

# ---------------------フォローアンフォロー機能-------------------------


  def follow(other_user)
    unless self == other_user
      self.relatiuonships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def feed_records
    Record.where(user_id: self.following_ids + [self.id])
  end
end
