class RailsOmniauth.Views.ClientIndex extends RailsOmniauth.Views.BaseView
  el: '#js-client-auth-container'

  events:
    'click #js-refresh-token-btn': 'refreshToken'
    'click #js-fetch-header-btn'  : 'fetchHeader'

  refreshToken:()=>
    $.get '/clients/refresh_token',
      (data)=>
        token = data.access_token
        @$('#js-client-token').html(token)

  fetchHeader:()=>
    $.get('/clients/external_header',
      (data)=>
        external_header  = data.external_header
        @$('#js-header-content').html(external_header)
    ).fail (jxhr, status, error)->
        alert("#{status} #{error}");

