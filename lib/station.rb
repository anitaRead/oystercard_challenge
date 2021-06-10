class Station

    attr_reader :zone, :name

    def initialize(name, zone)
        @name = name
        @zone = zone
        # @zones = { 
        #     4 => ["Hendon", "Mill Hill"]
        # }
    end

    # def get_zone
    #    @zones.each { |k, v| return k if v.include? @name }
    # end

end