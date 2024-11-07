# frozen_string_literal: true

class Mention < ApplicationRecord
  belongs_to :mentioning_report, class_name: 'Report'
  belongs_to :mentioned_report, class_name: 'Report'

  validates :mentioning_report_id, uniqueness: { scope: :mentioned_report_id }
  validate :mention_ids_cannot_be_same

  private

  def mention_ids_cannot_be_same
    return if mentioning_report_id != mentioned_report_id

    errors.add(:mentioned_report_id)
  end
end
