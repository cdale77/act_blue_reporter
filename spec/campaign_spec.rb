require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Campaign do

    let(:campaign) { ActBlueReporter::Campaign.new("", "", "") }

    describe '#details' do
      it 'should return something' do
        expect(campaign.details).to eq "d"
      end
    end


  end

end