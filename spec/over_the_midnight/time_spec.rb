require 'spec_helper'

describe OverTheMidnight::Time do
  let(:obj) { described_class.new(date, time) }
  let(:today) { Date.today }
  let(:date) { today }
  let(:time) { "9:00" }

  describe ".new" do
    subject { obj }
    
    context "with String time" do
      let(:time) { "25:00" }
      let(:next_date) { date + 1 }
      
      it { expect(subject.time).to eq Time.new(next_date.year, next_date.month, next_date.day, 1, 0) }
    end
    
    context "with Numeric time" do
      let(:time) { 30.5 }
      let(:next_date) { date + 1 }
      it { expect(subject.time).to eq Time.new(next_date.year, next_date.month, next_date.day, 6, 30) }
    end
    
    context "with Time" do
      let(:time)  { Time.local(date.year, date.month, date.day, hour, min) }
      let(:hour)  { 10 }
      let(:min)   { 45 }
      it { expect(subject.time.day).to eq time.day }
      
      context "with not same date" do
        let(:time_date) { today + 1 }
        let(:time) { Time.local(time_date.year, time_date.month, time_date.day, hour, min) }
        
        it { expect(subject.time.day).to      eq time.day }
        it { expect(subject.time.day).not_to  eq date.day }
      end
    end
  end
  
  describe "#date" do
    subject { obj.date }
    it { is_expected.to be_kind_of(Date) }
    it { is_expected.to eq date }
  end
  
  describe "#time" do
    subject { obj.time }
    it { is_expected.to be_kind_of(Time) }
  end
  
  describe "#hour" do
    subject { obj.hour }
    let(:time) { "25:00" }
    
    it { is_expected.to eq 25 }
  end
  
  describe "#to_s" do
    subject { obj.to_s }
    
    context "with valid date, time" do
      it { is_expected.to match /[0-9]{4}\/[0-9]{2}\/[0-9]{2}\s{1}[0-9]+\:[0-9]{2}/ }
    end
    
    context "with Time next date" do
      let(:diff) { 1 }
      let(:tomorrow) { date + diff }
      let(:time)  { Time.local(tomorrow.year, tomorrow.month, tomorrow.day, hour, min) }
      let(:hour)  { 10 }
      let(:min)   { 45 }
      it { is_expected.to match /#{date.strftime("%d")}\s{1}/ }
      it { is_expected.to match /#{hour + (diff * 24)}\:/ }
    end
  end
end
