require 'dockingstation'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
  it 'has a variable maximum capacity' do
    station = DockingStation.new(50)
    expect(station.capacity).to eq 50
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'should not release a bike when empty' do
      expect{ subject.release_bike }.to raise_error "There are no available bikes"
    end
    it 'should not release a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error "There are no available bikes"
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'should raise an error if full' do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error "The dock is full"
    end 
    
  end
end
