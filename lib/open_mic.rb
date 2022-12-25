class OpenMic 
  attr_reader :location, :date, :performers 

  def initialize(attributes)
    @location = attributes[:location]
    @date = attributes[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes? 
   
    if all_jokes.uniq == all_jokes
      false
    else 
      true
    end
  end

 def all_jokes 
  @performers.flat_map do |performer| 
    performer.jokes
  end
 end
end