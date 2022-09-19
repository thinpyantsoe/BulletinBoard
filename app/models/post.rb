class Post < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates_inclusion_of :public_flag, :in => [true, false]

    require 'csv'
    def self.to_csv
        attributes = Constants::POST_CSV_HEADER
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |post|
                csv << attributes.map{ |attr| post.send(attr) }
            end
        end
    end

    def csv_format
        attributes = Constants::POST_CSV_FORMAT_HEADER
        CSV.generate(headers:true) do |csv|
            csv << attributes
        end
    end

    def self.import(file, current_user_id)
      CSV.foreach(file.path, headers: true) do |row|
          Post.create! row.to_hash.merge(user_id: current_user_id, created_at: Time.now, updated_at: Time.now)
      end
  end
end
