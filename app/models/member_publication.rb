class MemberPublication < ApplicationRecord
  belongs_to :member
  belongs_to :publication
end
