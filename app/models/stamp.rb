class Stamp < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  # def self.search(name)
  #   return Stamp.all unless search
  #   # Stamp.where(['name LIKE ?', "%#{name}%"])
  #   Stamp.where(['name LIKE ?', "%#{name.values}%"])
  # end
end
