class TroubleCategory < ApplicationRecord
  belongs_to :trouble
  belongs_to :category
end
