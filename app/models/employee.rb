class Employee < ApplicationRecord
    belongs_to :dog

    validates :title, uniqueness: true
    validates :alias, uniqueness: true

    def to_s
        full_name = self.first_name + " " + self.last_name
        full_name
    end

end
