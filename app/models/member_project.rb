class MemberProject < ApplicationRecord
  belongs_to :member
  belongs_to :project
end
