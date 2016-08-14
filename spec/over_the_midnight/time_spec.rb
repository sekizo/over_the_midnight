require 'spec_helper'

describe OverTheMidnight::Time do
  describe ".new" do
    subject { described_class.new(date, time) }
    let(:date) { Date.today }

    context "with String time" do
      let(:time) { "25:00" }
      let(:next_date) { date + 1 }
      
      it { expect(subject.to_time).to eq Time.new(next_date.year, next_date.month, next_date.day, 1, 0) }
    end
    
    context "with Numeric time" do
      let(:time) { 30.5 }
      let(:next_date) { date + 1 }
      it { expect(subject.to_time).to eq Time.new(next_date.year, next_date.month, next_date.day, 6, 30) }
    end
  end
end
