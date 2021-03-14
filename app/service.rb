require 'sinatra'
require "sinatra/namespace"

class message
    @@message = [
        { id: "123", name: ""You will obey or molten silver will be poured into your ears." }
        
    ]

    def self.all
        @@message
    end

    def self.find(message_id)
        @@message.select { |p| p[:id] == message_id }.first
    end
end

get '/' do
    'Healthy!!!'
end

get '/stat' do
    'Healthy!!!'
end

namespace '/api' do

    before do
        content_type 'application/json'
    end
    
    # /api/messages
    get '/messages' do
        message.all.to_json
    end

    # /api/messages/:id
    get '/messages/:id' do
        if (message = message.find(params[:id])) != nil
            message.to_json
        else
            halt(404, { message:'message Not Found'}.to_json)
        end
    end

end
