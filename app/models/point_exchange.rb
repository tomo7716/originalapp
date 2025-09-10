class PointExchange < ApplicationRecord
  belongs_to :student

  enum status: {
    pending: "pending",   # 承認待ち
    approved: "approved", # 承認済み
    rejected: "rejected"  # 却下
  }, _default: :pending
end
