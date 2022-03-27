class Lechon < ApplicationRecord
  belongs_to :oven
  belongs_to :supplier
  belongs_to :cartitem
end
