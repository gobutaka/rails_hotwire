class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :pokedex_number, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :total_base_stats, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
