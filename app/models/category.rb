class Category < ApplicationRecord
  validates :label, presence: true
end