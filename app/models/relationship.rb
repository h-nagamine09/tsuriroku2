class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'#follow というクラスはない。ユーザークラスを参照させる
end
