require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Campaign do

    let(:campaign) { ActBlueReporter::Campaign.new("", "", "") }

    describe '#details' do
      it 'should return something' do
        expect(campaign.details).to be_an_instance_of Hash
      end
    end


  end

end