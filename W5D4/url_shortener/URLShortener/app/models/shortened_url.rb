# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :user_id, :short_url, presence: true, uniqueness: true 
    validates :long_url, presence: true 

    def self.random_code
        begin
        s_url = SecureRandom.urlsafe_base64  
        rescue self.exists?(:short_url => s_url) 
            retry
        end
        
        s_url        
    end

    def self.shorten(user, long_url)
        self.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
    end 

    belongs_to(:submitter,
        foreign_key: :user_id,
        primary_key: :id,
        class_name: :User
        )

    has_many(:visitors,
        foreign_key: :shortened_url_id,
        primary_key: :id,
        class_name: :Visit
    )

    def num_clicks
        Visit.count(conditions: "shortened_url_id == self.id")
        # Visit.count(:shortened_url_id => self.id
    end
end 
