# == Schema Information
#
# Table name: drops
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Drop < ApplicationRecord
  validates :body, presence: true

  belongs_to :author, # :author is method name.
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User
  
  has_one :location,
    through: :author,
    source: :location










    def self.n_plus_1_print_drop_and_author
      Drop.all.each do |drop| 
        p "#{drop.body} by #{drop.author.username}" # this fires another query for each iteration of the block
      end

      nil
    end
 

    def self.print_drop_and_author
      Drop.includes(:author).each do |drop| # .includes pre-fetches each drop's author all in one separate query (this is NOT a join)
  
         p "#{drop.body} by #{drop.author.username}" # now we don't initiate another query for each iteration of this block
        
      end
      nil
    end
end
