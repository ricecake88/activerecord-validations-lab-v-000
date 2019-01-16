class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        valid_titles = ["Won't Believe", "Secret", "Guess"]
        if !(/Top \d+/.match(value)).nil?
          true
        end
        valid_titles.each do |valid_title|
          if value.include? valid_title
              true
          else
            record.errors[attribute] << "is not valid"
            false
          end
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, title: {allow_blank: false}
    validates :summary, presence: true, length: {maximum: 250}
    validates :content, presence: true, length: {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end  

  
