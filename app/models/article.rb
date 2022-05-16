#Active record design pattern >> each row is an obj from a model class 
#title & body are Article class attributes .. on the fly :D

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy   #delete associated

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end

