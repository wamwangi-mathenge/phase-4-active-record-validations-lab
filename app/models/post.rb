class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: [ "Fiction", "Non-Fiction" ]
    validate :clickbaity_title

    def clickbaity_title
        unless title.present? && title.match?(/(secret)|(won't believe)|(guess)|(top [0-9]+)/i)
            errors.add(:title, "Title not clickbait-y")
        end
    end
    
end
