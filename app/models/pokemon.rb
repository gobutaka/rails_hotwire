class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :pokedex_number, presence: true, numericality: {only_integer: true}
  validates :total_base_stats, presence: true, numericality: {only_integer: true}
end
