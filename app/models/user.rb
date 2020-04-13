class User < ApplicationRecord
  validates :name, length: { minimum: 6 } 
end
