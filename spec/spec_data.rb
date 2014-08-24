module SpecData
  def self.act_blue_entity_response_xml
    "<entity id='00000'
        href='https://secure.actblue.com/api/2009-08/entities/28576'>
      <displayname>Test Committee</displayname>
      <legalname>Test Committee</legalname>
      <prefacewitharticle>false</prefacewitharticle>
      <sortname>test committee</sortname>
      <kind>org</kind>
      <govid>C00231076</govid>
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
end