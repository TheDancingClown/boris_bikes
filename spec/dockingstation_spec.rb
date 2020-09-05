require 'dockingstation'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a working bike' do
      bike = subject.release_bike
      expect(bike.working?).to eq true
    end
  end

end
