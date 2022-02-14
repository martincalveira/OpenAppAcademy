require_relative "room"

class Hotel
    def initialize(name, capacity_hash)
        @name = name
        @rooms = {}
        capacity_hash.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end

    def name
        name_arr = []
        @name.split.each { |ele| name_arr << ele.capitalize}
        name_arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.key?(room_name)
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        !@rooms.all? { |k, v| v.full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end
end
