class Station

    attr_reader :zone, :name

    def initialize(name)
        @name = name
        @zones = { 
            4 => ["Hendon", "Mill Hill"]
        }
        @zone = get_zone
    end

    def get_zone
       @zones.each { |k, v| return k if v.include? @name }
    end

end