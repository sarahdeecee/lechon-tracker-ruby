class Lechon < ApplicationRecord
  belongs_to :order
  belongs_to :oven
  belongs_to :supplier
end
