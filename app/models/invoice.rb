class Invoice < ApplicationRecord
  enum status: { pending: 0, partially_paid: 1, paid: 2 }
  enum counterparty_type: { customer: 0, vendor: 1 }

  has_one_attached :document

  has_many :line_items, dependent: :destroy

  validates :internal_id, :external_id, presence: true, uniqueness: true

  before_validation :init_external_and_internal_ids, on: :create

  accepts_nested_attributes_for :line_items, allow_destroy: true

  validate :correct_document_mime_type

  private

  def init_external_and_internal_ids
    self.external_id = "INV_EXT_#{Invoice.last.try(:id).to_i + 1}"
    self.internal_id = "INV_INT_#{Invoice.last.try(:id).to_i + 1}#{SecureRandom.hex(4)}"
  end

  def correct_document_mime_type
    if document.attached? && !document.content_type.in?(%w(application/pdf))
      document.purge # delete the uploaded file
      errors.add(:document, 'Must be a PDF file')
    end
  end
end
