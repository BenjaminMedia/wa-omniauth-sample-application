class ClientsController < ApplicationController
  def index
  end

  def refresh_token
    response = RestClient.post "#{Rails.application.secrets.wa_site_url}api/oauth/token", {
      grant_type: 'client_credentials',
      client_id: Rails.application.secrets.bonnier_key,
      client_secret: Rails.application.secrets.bonnier_secret
    }
    access_token = JSON.parse(response)["access_token"]
    session['access_token'] = access_token
    render json: {access_token: access_token}
  end

  def external_header
    response = RestClient.get "#{Rails.application.secrets.wa_site_url}api/v1/external_headers/full", {'Authorization' => "Bearer #{session['access_token']}"}
    response = response.force_encoding("UTF-8")
    render json: {external_header: response}
  end
end
