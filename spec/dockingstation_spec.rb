require 'dockingstation'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a working bike' do
      bike = subject.release_bike
      expect(bike.working?).to eq true
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
  end

end
