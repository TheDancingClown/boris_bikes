require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      fail 'There are no available bikes'
    else 
      @bikes.pop
    end
  end

  def dock(bike)
    if bikes.count >= 20
      fail "The dock is full"
    else
      @bikes << bike
    end
  end

end