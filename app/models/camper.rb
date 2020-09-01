class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than_or_equal_to: 8}
    validates :age, numericality: {less_than_or_equal_to: 18}

    def top_three_activities
        array = self.activities.max_by(3) do |activity_instance|
            activity_instance.name
        end
    end

    def self.most_active_five
        self.all.max_by(5) do |camper|
            camper.activities.count
        end
    end

end
