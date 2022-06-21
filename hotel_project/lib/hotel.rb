require_relative "room"

class Hotel

    attr_reader  :rooms
    def initialize(name, hash)
        @name = name
        # @rooms = hash.each do |k,v|   
        #     hash[k]= Room.new(v)
        # end
        @rooms = hash.map {|k,v| [k, Room.new(v)]}.to_h
    end

    def name 
        @name.split(" ").map {|ele| ele.capitalize}.join(" ")
    end

    def room_exists?(name)
        @rooms[name] ? true : false
    end


    def check_in(person_name, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else
           if  @rooms[room_name].add_occupant(person_name)
            puts "check in successful"
           else
            puts "sorry, room is full"
           end
        end
    end

    def has_vacancy?
        !(@rooms.values.all? {|room| room.full?})
    end

    def list_rooms
        @rooms.each do |k,v|
            puts k + " " + v.available_space.to_s
        end
    end

end




