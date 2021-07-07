class Project
    attr_reader :title

    @@all = []

    def initialize title
        @title = title

        @@all << self
    end

    def self.all 
        @@all
    end

    def add_backer backer 
        ProjectBacker.new self, backer
    end

    def project_backers
        ProjectBacker.all.select {|backed_project| backed_project.project == self}
    end

    def backers
        project_backers.map {|backed_project| backed_project.backer}
    end
end