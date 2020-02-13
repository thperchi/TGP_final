class JoinGossipTag < ApplicationRecord
    belongs_to :gossip
    has_many :tags
end
