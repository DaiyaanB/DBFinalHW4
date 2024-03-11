# app/models/entry.rb Edited with help of GPT to do storage locally

class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one_attached :image
end
