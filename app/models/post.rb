class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        valid_titles = ["Won't Believe", "Secret", "Guess"]
        if valid_titles.include?value or !(/Top \d+/.match(value)).nil?
          return true
        else
            record.errors[attribute] << "is not valid"
          return false
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true, title: true
    validates :summary, presence: true, length: {maximum: 250}
    validates :content, presence: true, length: {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end  

  
