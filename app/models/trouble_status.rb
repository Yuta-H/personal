class TroubleStatus < ApplicationRecord
  belongs_to :trouble
  belongs_to :status
end
