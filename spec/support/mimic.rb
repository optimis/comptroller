require 'mimic'
require 'socket'

Mimic.mimic do
  get '/practices' do
    [200, {}, [{
        billing: true,
        created_at: "2013-07-16T01:16:45Z",
        export_url: "https://optimis.duxware.com/bridge.optimis.data.php",
        external_id: 3,
        id: 1,
        migrated_at: nil,
        subdomain: nil,
        token: "9123ikc9u0i3flk2p83cc4osdm4mcaaw",
        updated_at: "2013-07-16T01:16:45Z"
      }].to_json
    ]
  end
end
