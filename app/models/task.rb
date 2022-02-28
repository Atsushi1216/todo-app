class Task < ApplicationRecord
  class Task < ApplicationRecord
    #空では保存させないためにpresence追加
    validates :title, presence: true
    validates :body, presence: true
  end
end
