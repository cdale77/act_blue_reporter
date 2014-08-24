require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Campaign do

    let!(:campaign) { ActBlueReporter::Campaign.new("", "", "") }

    describe '#initialize' do
      it 'should create an object' do
        expect(campaign).to be_an_instance_of ActBlueReporter::Campaign
      end
    end

    describe '#details' do

      it 'should be successful' do
        response = campaign.details
        expect(response).to be_an_instance_of Hash
      end
    end
  end

end