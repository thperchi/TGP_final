class Gossip < ApplicationRecord
    belongs_to :user
    has_many :tags, through: :join_gossip_tag
    validates :title, presence: true, length: { in: 3..14 }
    validates :content, presence: true
end
