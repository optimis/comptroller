require 'mimic'
require 'socket'

Mimic.mimic do
  set :practices, {
    1 => {
      id: 1,
      export_url: "https://optimis.duxware.com",
      external_id: 3,
      token: "12345",
      migrated_at: nil,
      billing: true,
      created_at: "2013-07-16T01:16:45Z",
      updated_at: "2013-07-16T01:16:45Z"
    }
  }

  get '/practices' do
    [ 200, {}, settings.practices.values.to_json ]
  end

  get '/practices/:id' do
    [ 200, {}, settings.practices[params[:id].to_i].to_json ]
  end

  post '/practices' do
    practice_params = params[:practice]
    new_id = settings.practices.keys.max + 1 # fake auto incrementing private keys
    new_practice = {
      billing: false,
      created_at: "2013-07-16T01:16:45Z",
      export_url: practice_params[:export_url],
      external_id: practice_params[:external_id].to_i,
      id: new_id,
      migrated_at: nil,
      token: practice_params[:token],
      updated_at: "2013-07-16T01:16:45Z"
    }

    settings.practices[new_id] = new_practice
    [ 200, {}, new_practice.to_json ]
  end

  put '/practices/:id' do
    practice = settings.practices[params[:id].to_i]
    practice.merge!(params[:practice])
    [ 200, {}, practice.to_json ]
  end

  get '/duxware_errors' do
    [200, {}, [{
        error_message: 'Send to optimis.duxware.com failed with ERROR: Did not find this ICD code in DB: 729.90',
        external_id: 3,
        id: 1,
        message_body: '<?xml version="1.0" encoding="UTF-8"?><incomingHeader></incomingHeader>',
        record_id: 43334,
        resent_at: nil,
        created_at: "2013-06-13T16:17:02Z",
        updated_at: "2013-06-13T16:17:02Z"
      }].to_json
    ]
  end
end
