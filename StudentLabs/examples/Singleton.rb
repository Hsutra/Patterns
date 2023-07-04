class GetInfo

    private_class_method :new 

    def self.instance
      @instance ||= new
    end
  
end

text = GetInfo.instance

text2 = GetInfo.instance

puts text == text2