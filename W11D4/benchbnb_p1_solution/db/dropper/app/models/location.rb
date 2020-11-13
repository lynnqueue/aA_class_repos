# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  validates :name, presence: true

  has_many :users,
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :User
  
  has_many :drops,
    through: :users, # existing association in current class
    source: :drops   # association defined in class specified in through association (eg. :users association)


  def self.location_with_no_drops
    # find locations that do not have any drops
    Location.left_outer_joins(:drops).where(drops: { body: nil }).distinct
      # when our `where` condition uses a column in a different model, we need to specify the table using nested hash syntax: 
        # `.where(table: { col: value })`
  end


end
