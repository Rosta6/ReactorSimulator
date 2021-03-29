# class for parsing input file

class InputParser

    attr_reader :core_map

    def initialize(path)
        
        @core_map = {}

        parseInput(path)

        validate()
    end

    private
    def parseInput(path)
        dataHash = {}
        input_array = File.open(path).read.split("\n")
        input_array.each_with_index do |line, index|
            if line.match(/begin\s.+$/)
                key = line.split(" ").last
                temp_index = index + 1
                tempAry = []
                until input_array[temp_index].match(/end\s.+$/)
                    tempAry << input_array[temp_index]
                    temp_index += 1
                end
                dataHash[key] = tempAry
            end
        end    
        @core_map = hashCoreMaptoCartesian(dataHash["core_map"])

    end

    def hashCoreMaptoCartesian(core_data)
        # čísluje se po čtvercích zleva dole
        xlength = core_data.first.split(" ").length
        core_hash = {}
        core_data.each_with_index do |yline, ypos|
            temp_hash = {}

            # some validation just for square core for now
            if xlength != yline.split(" ").length
                puts Paint["Bad number of elements in the core on line #{ypos + 1}: #{yline}!", :red, :bold]
                exit
            end

            yline.split(" ").each_with_index do |xval, xpos|
                temp_hash[xpos] = xval
            end
            core_hash[core_data.length - ypos - 1] = temp_hash
        end
        core_hash
    end

    def validate()
        if @core_map == nil
            puts Paint["Core map not found! It should be provided in an input file!", :red, :bold]
            exit
        end
    end


end