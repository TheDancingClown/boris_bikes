require 'dockingstation'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(bike.working?).to eq true
    end
    it 'should not release a bike when empty' do
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
      20.times {subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error "The dock is full"
    end 
  end
end
