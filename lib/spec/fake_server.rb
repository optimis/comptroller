require 'mimic'
require 'socket'

class DataManager
  class << self
    def practices_memo
      { 1 => {
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
    end

    def claim_errors_memo
      { 1 => {
          error_message: 'Send to optimis.duxware.com failed with ERROR: Did not find this ICD code in DB: 729.90',
          external_id: 3,
          id: 1,
          message_body: '<?xml version="1.0" encoding="UTF-8"?><incomingHeader></incomingHeader>',
          record_id: 43334,
          resent_at: nil,
          created_at: "2013-06-13T16:17:02Z",
          updated_at: "2013-06-13T16:17:02Z"
        },
        2 => {
          error_message: 'Send to optimis.duxware.com failed with ERROR: Did not find this ICD code in DB: 729.91',
          external_id: 4,
          id: 2,
          message_body: '<?xml version="1.0" encoding="UTF-8"?><incomingHeader></incomingHeader>',
          record_id: 43335,
          resent_at: nil,
          created_at: "2013-06-13T16:17:02Z",
          updated_at: "2013-06-13T16:17:02Z"
        }
      }
    end

    def practices
      @practices ||= practices_memo.dup
    end

    def reset
      @claim_errors = claim_errors_memo.dup
      @practices = practices_memo.dup
    end

    def claim_errors
      @claim_errors ||= claim_errors_memo.dup
    end
  end
end

Mimic.mimic(:hostname => Comptroller::Configuration::HOSTNAME, :port => Comptroller::Configuration::PORT) do
  if defined?(Rails)
    p "[NOTICE] Starting fake billing service on port #{Comptroller::Configuration::PORT}"
  end

  get '/practices' do
    [ 200, {}, DataManager.practices.values.to_json ]
  end

  get '/practices/:id' do
    [ 200, {}, DataManager.practices[params[:id].to_i].to_json ]
  end

  post '/practices' do
    practice_params = params[:practice]
    new_id = DataManager.practices.keys.max + 1 # fake auto incrementing private keys
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

    DataManager.practices[new_id] = new_practice
    [ 200, {}, new_practice.to_json ]
  end

  put '/practices/:id' do
    practice = DataManager.practices[params[:id].to_i]
    practice.merge!(params[:practice])
    [ 200, {}, practice.to_json ]
  end

  delete '/practices/:id' do
    deleted_practice = DataManager.practices.extract!(params[:id].to_i)[params[:id].to_i]
    [ 200, {}, deleted_practice.to_json ]
  end

  get '/duxware_errors/count' do
    claim_error_count = if params[:external_id]
      DataManager.claim_errors.values.count do |claim_error|
        claim_error[:external_id] == params[:external_id].to_i
      end
    else
      DataManager.claim_errors.keys.size
    end 

    [ 200, {}, { :count => claim_error_count }.to_json ]
  end

  get '/duxware_errors' do
    claim_errors = if params[:external_id]
      DataManager.claim_errors.values.select do |claim_error|
        claim_error[:external_id] == params[:external_id].to_i
      end
    else
      DataManager.claim_errors.values
    end
    [ 200, {}, claim_errors.to_json ]
  end

  get '/duxware_errors/:id' do
    [ 200, {}, DataManager.claim_errors[params[:id].to_i].to_json ]
  end

  put '/duxware_errors/:id' do
    claim_error = DataManager.claim_errors[params[:id].to_i]
    claim_error.merge!(params[:claim_error])
    [ 200, {}, claim_error.to_json ]
  end

  delete '/duxware_errors/:id' do
    DataManager.claim_errors[params[:id].to_i]
    deleted_error = DataManager.claim_errors.extract!(params[:id].to_i)[params[:id].to_i]
    [ 200, {}, deleted_error.to_json ]
  end
  
  get '/resets' do
    DataManager.reset
  end
end
