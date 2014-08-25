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
        expect {failing_campaign.details}.to raise_error
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
        expect{failing_campaign.all_contributions}.to raise_error
      end
    end
  end

=begin
  describe '#contributions_in_date_range' do
    describe 'success' do
      let(:response) { act_blue_campaign.contributions_in_date_range(  (Time.now.at_beginning_of_day - 24.hours).iso8601,
                                                                       (Time.now.at_beginning_of_day.iso8601)) }
      it 'should return a Hash' do
        response.should be_an_instance_of Hash
      end
    end
    describe 'failure' do
      it 'should raise an exception' do
        expect { bad_act_blue_campaign.contributions_in_date_range(  (Time.now.at_beginning_of_day - 24.hours).iso8601,
                                                                     (Time.now.at_beginning_of_day.iso8601)) }.to raise_error
      end
    end
  end
=end
end
