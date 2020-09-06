require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if empty?
      fail 'There are no available bikes'
    else 
      @bikes.pop
    end
  end

  def dock(bike)
    if full?
      fail "The dock is full"
    else
      @bikes << bike
    end
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end