class Show < ActiveRecord::Base
    def self.highest_rating
        self.maximum(:rating)
    end
    def self.most_popular_show
        self.order("rating DESC")[0]
    end
    def self.lowest_rating
        self.minimum(:rating)
    end
    def self.least_popular_show
        self.order("rating ASC")[0]
    end
    def self.ratings_sum
        self.sum(:rating)
    end
    def self.popular_shows
        shows = []
        self.find_each do |show|
            show.rating > 5 ? shows << show : nil
        end
        shows
    end
    def self.shows_by_alphabetical_order
        self.order("name ASC")
    end

end
