class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        # takes a dev (an instance of the Dev class), 
        # an item_name (string), and a value as arguments, 
        # and creates a new Freebie instance associated with this company 
        # and the given dev
        found_dev = Dev.find_by(name: dev)
        self.freebies << Freebie.create(dev: found_dev, item_name: item_name, value: value, company: self)
        self.freebies.last
    end

    def self.oldest_company
        # returns the Company instance with the earliest founding year
        Company.all.order(founding_year: :asc).first
    end

end
