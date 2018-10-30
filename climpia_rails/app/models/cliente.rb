class Cliente < ApplicationRecord
  belongs_to :usuario
  validates :usuario, presence: true
  has_many :solicituds
end
