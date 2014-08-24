require "spec_helper"

describe ActBlueReporter do

  describe ActBlueReporter::Connect do

    let(:act_blue_connect) { ActBlueReporter::Connect.new }
    let(:request_url) { }
    let(:request_auth) { }

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

    describe '#initialize' do
      it 'should create an object' do
        expect(act_blue_connect).to be_an_instance_of ActBlueReporter::Connect
      end
      it 'should have #success set to false' do
        expect(act_blue_connect.success).to be_falsey
      end
      it 'should have #message set to an empty string' do
        expect(act_blue_connect.message).to eql ""
      end
    end
  end
end
