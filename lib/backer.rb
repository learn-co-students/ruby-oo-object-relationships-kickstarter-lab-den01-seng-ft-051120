class Backer
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        result = ProjectBacker.all.select do |item|
            item.backer == self
        end
        result.map do |result_item|
            result_item.project
        end.uniq
    end
end