class MyValidator < ActiveModel::Validator
    def validate(title)
        valid_titles = ["Won't Believe",  "Secret", "Guess"]
        if valid_titles.include?title || title.match("Top /\d/+")
            return true
        end
        return false
    end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :summary, presence: true, length: {maximum: 250}
    validates :content, presence: true, length: {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates_with MyValidator
end  

  
