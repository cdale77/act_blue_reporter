require "spec_helper"

describe ActBlueReporter::ContributionReport do

  let!(:campaign) { ActBlueReporter::Campaign.new("", "", "") }
  let!(:payload) { campaign.contributions_in_last_24_hrs }
  let!(:report) { ActBlueReporter::ContributionReport.new(payload) }

  describe '#initialize' do
    it 'should create an object' do
      expect(report).to be_an_instance_of ActBlueReporter::ContributionReport
    end
  end

  describe '#payload' do
    it 'should return the original payload' do
      expect(report.payload). to eq payload
    end
  end
  describe '#report' do
    it 'should return an array of contributions' do
      expect(report.report).to be_an_instance_of Array
    end
  end

  describe '#count' do
    it 'should return the number of contributions' do
      expect(report.count).to eq payload["count"]
    end
  end
end
