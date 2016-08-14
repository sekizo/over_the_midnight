require 'spec_helper'

describe OverTheMidnight do
  it 'has a version number' do
    expect(OverTheMidnight::VERSION).not_to be nil
  end

  describe ".new" do
    subject { described_class.new(date, time) }
    let(:date) { Date.today }
    let(:time) { "25:00" }
    it { is_expected.to be_kind_of(described_class::Time) }
  end
end
