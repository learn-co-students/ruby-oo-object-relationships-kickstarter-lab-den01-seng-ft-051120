class Project
    attr_reader :title

    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        backer_result = ProjectBacker.all.select do |pro_back|
            pro_back.project == self
        end
        backer_result.map do |back_item|
            back_item.backer
        end.uniq
    end
end

