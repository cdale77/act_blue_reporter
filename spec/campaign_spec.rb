require "spec_helper"

describe ActBlueReporter::Campaign do

  let!(:campaign) { ActBlueReporter::Campaign.new("", "", "") }
  let!(:failing_campaign) { ActBlueReporter::Campaign.new("", "", "0") }
  let!(:details_response) { campaign.details }
  let!(:all_contributions_response) { campaign.all_contributions }

  describe '#initialize' do
    it 'should create an object' do
      expect(campaign).to be_an_instance_of ActBlueReporter::Campaign
    end
  end

  describe '#details' do
    describe 'success' do
      it 'should return a Hash' do
        expect(details_response).to be_an_instance_of Hash
      end
      it 'should return a response with the correct info' do
        expect(details_response["id"]).to eql "00000"
        expect(details_response["displayname"]).to eql "Test Committee"
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
          expect(all_contributions_response).to be_an_instance_of Hash
        end
      end
      describe 'failure' do
        it 'should raise an error' do
          expect{failing_campaign.all_contributions}.to raise_error
        end
      end
    end
end
