class TitleValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        valid_titles = ["Won't Believe", "Secret", "Guess"]
        if !(/Top \d+/.match(value)).nil?
          return true
        end
        valid_titles.each do |valid_title|
          if value.include? valid_title
            binding.pry
             return true
          end
        end
        record.errors[attribute] << "is not valid"        
        return false
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true, allow_nil: false, allow_blank: false, title: true
    validates :summary, presence: true, length: {maximum: 250}
    validates :content, presence: true, length: {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end  

  
