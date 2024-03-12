# app/models/place.rb
class Place < ApplicationRecord
  has_many :entries
end
