class Lechon < ApplicationRecord
  belongs_to :oven, optional: true
  belongs_to :supplier, optional: true
  belongs_to :order
end
