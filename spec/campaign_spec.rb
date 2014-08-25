require "spec_helper"

describe ActBlueReporter::Campaign do

  let!(:campaign) { ActBlueReporter::Campaign.new("", "", "") }
  let!(:failing_campaign) { ActBlueReporter::Campaign.new("", "", "0") }

  describe '#initialize' do
    it 'should create an object' do
      expect(campaign).to be_an_instance_of ActBlueReporter::Campaign
    end
  end

  describe '#details' do
    describe 'success' do
      it 'should return a Hash' do
        expect(campaign.details).to be_an_instance_of Hash
      end
      it 'should return a response with the correct info' do
        expect(campaign.details["id"]).to eql "00000"
        expect(campaign.details["displayname"]).to eql "Test Committee"
      end
    end
    describe 'failure' do
      it 'should raise an error' do
        expect { failing_campaign.details }.to raise_error
      end
    end
  end

  describe '#all_contributions' do
    describe 'success' do
      it 'should return a Hash' do
        expect(campaign.all_contributions).to be_an_instance_of Hash
      end
    end
    it 'should return a response with the correct info' do
      expect(campaign.all_contributions["count"]).to eq "3"
    end
    describe 'failure' do
      it 'should raise an error' do
        expect { failing_campaign.all_contributions }.to raise_error
      end
    end
  end

  describe '#contributions_in_time_range' do
    describe 'success' do
      start_time = "2014-08-23T00:00:00-07:00"
      end_time = "2014-08-24T00:00:00-07:00"
      describe 'success' do
        it 'should return a Hash' do
          expect(campaign.contributions_in_time_range(start_time, end_time)).to \
          be_an_instance_of Hash
        end
      end
    end
    describe 'failure' do

    end
  end

end
