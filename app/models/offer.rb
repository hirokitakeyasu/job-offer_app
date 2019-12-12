# == Schema Information
#
# Table name: offers
#
#  id         :bigint           not null, primary key
#  body       :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#

class Offer < ApplicationRecord
  belongs_to :user
  has_many :offer_tag_relations, dependent: :delete_all
  has_many :tags, through: :offer_tag_relations
  
  scope :with_keywords, -> keywords {
    if keywords.present?
      columns = [:title]
      where(keywords.split(/[[:space:]]/).reject(&:empty?).map {|keyword|
        columns.map { |a| arel_table[a].matches("%#{keyword}%") }.inject(:or)
      }.inject(:and))
    end
  }
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
end
