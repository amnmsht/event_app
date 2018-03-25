class Contact < ApplicationRecord
  validates :name, presence: true,length: { in: 1..140 } 
  validates :email, presence: true,length: { in: 1..140 }
  validates :content, presence: true,length: { in: 1..140 }
end
