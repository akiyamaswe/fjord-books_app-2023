# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :active_mentioning, class_name: 'Mention', foreign_key: 'mentioning_report_id', inverse_of: :mentioning_report, dependent: :destroy
  has_many :mentioning_reports, through: :active_mentioning, source: :mentioned_report
  has_many :passive_mentioned, class_name: 'Mention', foreign_key: 'mentioned_report_id', inverse_of: :mentioned_report, dependent: :destroy
  has_many :mentioned_reports, through: :passive_mentioned, source: :mentioning_report

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  REPORT_ID_URL = %r{http://localhost:3000/reports/(\d+)}

  def create_mentions
    extracted_ids = content.scan(REPORT_ID_URL).flatten.uniq.map(&:to_i)
    Mention.where(mentioning_report_id: id).destroy_all

    extracted_ids.all? do |extracted_id|
      Mention.create(mentioning_report_id: id, mentioned_report_id: extracted_id).valid?
    end
  end
end
