class Backer
    attr_reader :name

    @@all = []

    def initialize name
        @name = name

        @@all << self
    end

    def self.all 
        @@all
    end

    def back_project project
        ProjectBacker.new project, self
    end

    def project_backers
        ProjectBacker.all.select {|backed_project| backed_project.backer == self}
    end

    def backed_projects 
        project_backers.map {|back_project| back_project.project}
    end
end