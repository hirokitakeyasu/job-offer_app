# frozen_string_literal: true

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
  has_one_attached :image

  has_many :favorites, dependent: :delete_all
  has_many :users, through: :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  default_scope -> { order(created_at: :desc) }

  scope :with_keywords, -> keywords {
    if keywords.present?
      columns = [:name, :title]
      where(keywords.split(/[[:space:]]/).reject(&:empty?).map do |keyword|
        columns.map { |a| arel_table[a].matches("%#{keyword}%") }.inject(:or)
      end.inject(:and))
    end
  }

  validates :name, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
end
