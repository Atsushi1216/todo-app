class Task < ApplicationRecord

  belongs_to :user
  #空では保存させないためにpresence追加
  validates :title, presence: true
  validates :body, presence: true

end
