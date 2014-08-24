require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Connect do
    describe 'class constants' do
      it 'should have a constant for the ActBlue URI' do
        expect(ActBlueReporter::Connect::ACTBLUE_URI).to eql \
          "https://secure.actblue.com/api/2009-08"
      end
      it 'should have a constant for the headers' do
        expect(ActBlueReporter::Connect::HEADER).to be_an_instance_of Hash
        expect(ActBlueReporter::Connect::HEADER["Accept"]).to eql \
        "application/xml"
      end
    end
  end
end