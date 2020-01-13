class Invoice < ApplicationRecord
  enum status: { pending: 0, partially_paid: 1, paid: 2 }
  enum counterparty_type: { customer: 0, vendor: 1 }

  has_one_attached :document

  has_many :line_items, dependent: :destroy

  validates :internal_id, presence: true, uniqueness: true
  validates :external_id, uniqueness: true, if: lambda { |inv| inv[:external_id].present? }

  before_validation :init_internal_id, on: :create

  accepts_nested_attributes_for :line_items, allow_destroy: true

  private

  def init_internal_id
    self.internal_id = "#{SecureRandom.hex(4)}#{Invoice.last.try(:id).to_i + 1}"
  end
end
