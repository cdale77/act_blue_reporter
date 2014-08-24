require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Connect do
    describe 'class constants' do
      it 'should have a constant for the ActBlue URI' do
        expect(ActBlue::Connect::ACTBLUE_URI).to eql \
          "https://secure.actblue.com/api/2009-08"
      end
      it 'should have a constant for the headers' do
        expect(ActBlue::Connect::HEADER).to be_an_instance_of Hash
        expect(ActBlue::Connect::HEADER["Accept"]).to eql "application/xml"
      end
    end
  end
end