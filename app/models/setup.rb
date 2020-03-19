class Setup < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :builder, dependent: :destroy
  has_one :participant, dependent: :destroy

end
