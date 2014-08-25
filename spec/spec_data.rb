module SpecData
  def self.act_blue_entity_response_xml
    "<entity id='00000'
        href='https://secure.actblue.com/api/2009-08/entities/28576'>
      <displayname>Test Committee</displayname>
      <legalname>Test Committee</legalname>
      <prefacewitharticle>false</prefacewitharticle>
      <sortname>test committee</sortname>
      <kind>org</kind>
      <govid>A00000000</govid>
      <contributionlimit>5000.00</contributionlimit>
      <links>
        <link>https://secure.actblue.com/entity/fundraisers/00000</link>
        <donate>https://secure.actblue.com/contribute/entity/00000</donate>
        <website>http://example.com</website>
      </links>
      <listentries>
        <listentry page='example_event' entity='00000' position='1'>
          <page name='example'
              href='https://secure.actblue.com/api/2009-08/pages/example'>
            <user user-key='XXXXXXXXXXXX'>
              <email>example@example.com</email>
            </user>
            <title>Example</title>
            <author></author>
          </page>
          <blurb></blurb>
        </listentry>
      </listentries>
      <scoreboards>
        <scoreboard dimensions='entity'>
          <fact entity='00000'>
            <count>123</count>
            <total>31467.00</total>
          </fact>
        </scoreboard>
        <scoreboard dimensions='entity page'>
          <fact entity='00000' page='example2'>
            <page name='example2'
                href='https://secure.actblue.com/api/2009-08/pages/example2'>
              <user user-key='XXXXXXXXXXX'>
                <email>somebody@example.com</email>
              </user>
              <title>Contribute now</title>
              <author>Example Committee</author>
            </page>
            <count>215</count>
            <total>12184.00</total>
          </fact>
        </scoreboard>
        <scoreboard dimensions='candidacy entity'>
        </scoreboard>
      </scoreboards>
    </entity>"
  end

  def self.act_blue_contributions_response_xml

    "<?xml version='1.0' encoding='UTF-8'?>
      <contributions count='3'>
        <contribution order-number='AB00000000'>
          <source>
            <firstname>Jeff</firstname>
            <lastname>Jones</lastname>
            <addr1>1834 Richmond Ave</addr1>
            <addr2/>
            <city>San Jose</city>
            <state>CA</state>
            <zip>95128</zip>
            <country>United States</country>
            <employer>Self-employed</employer>
            <occupation>Attorney at law</occupation>
            <empaddr1/>
            <empaddr2/>
            <empcity/>
            <empstate/>
            <empzip/>
            <empcountry/>
            <email-preferred>false</email-preferred>
            <phone>408-555-5555</phone>
            <email>me@example.com.com</email>
          </source>
          <recurringtimes>3</recurringtimes>
          <refcode/>
          <referrer></referrer>
          <successuri></successuri>
          <lineitems>
            <lineitem effective-at='2012-04-03T04:19:00-04:00'>
              <amount>10.00</amount>
              <sequence>4</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname>Test Campaign</displayname>
              </entity>
            </lineitem>
            <lineitem effective-at='2012-03-03T04:22:53-05:00'>
              <amount>10.00</amount>
              <sequence>3</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname>Test Campaign</displayname>
              </entity>
            </lineitem>
            <lineitem effective-at='2012-05-03T04:17:22-04:00'>
              <amount>10.00</amount>
              <sequence>5</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname>Test Campaign</displayname>
              </entity>
            </lineitem>
          </lineitems>
        </contribution>
        <contribution order-number='AB00000000'>
          <source>
            <firstname>Captain</firstname>
            <lastname>Crunch</lastname>
            <addr1>180 East Ave</addr1>
            <addr2/>
            <city>Cupertino</city>
            <state>CA</state>
            <zip>95014</zip>
            <country>United States</country>
            <employer>Stanford</employer>
            <occupation>Student</occupation>
            <empaddr1/>
            <empaddr2/>
            <empcity/>
            <empstate/>
            <empzip/>
            <empcountry/>
            <email-preferred>false</email-preferred>
            <phone>408-555-5555</phone>
            <email>crunch@example.com</email>
          </source>
          <recurringtimes>2</recurringtimes>
          <refcode/>
          <referrer></referrer>
          <successuri></successuri>
          <lineitems>
            <lineitem effective-at='2012-04-05T04:15:41-04:00'>
              <amount>10.00</amount>
              <sequence>4</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname></displayname>
              </entity>
            </lineitem>
            <lineitem effective-at='2012-02-05T04:22:20-05:00'>
              <amount>10.00</amount>
              <sequence>2</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname>Test Campaign</displayname>
              </entity>
            </lineitem>
          </lineitems>
        </contribution>
        <contribution order-number='AB0000000'>
          <source>
            <firstname>Susan</firstname>
            <lastname>Smit</lastname>
            <addr1>6 Expressway, #125</addr1>
            <addr2/>
            <city>San Jose</city>
            <state>CA</state>
            <zip>95120</zip>
            <country>United States</country>
            <employer>Law Office</employer>
            <occupation>Attorney</occupation>
            <empaddr1/>
            <empaddr2/>
            <empcity/>
            <empstate/>
            <empzip/>
            <empcountry/>
            <email-preferred>false</email-preferred>
            <phone></phone>
            <email>example@example.com</email>
          </source>
          <recurringtimes>1</recurringtimes>
          <refcode/>
          <referrer></referrer>
          <successuri></successuri>
          <lineitems>
            <lineitem effective-at='2012-01-09T18:12:07-05:00'>
              <amount>500.00</amount>
              <sequence>1</sequence>
              <entity id='00000'>
                <legalname>Test Campaign</legalname>
                <displayname>Test Campaign</displayname>
              </entity>
            </lineitem>
          </lineitems>
        </contribution>
      </contributions>"
  end
end