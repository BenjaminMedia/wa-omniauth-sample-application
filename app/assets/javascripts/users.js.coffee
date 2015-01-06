$(document).ready ->
  $("#js-update-info-btn").click (e)->
    user_id = $(e.target).data("user-id")
    $.get "/users/#{user_id}/updated_info",
      (data)->
        $("#js-user-updated-info").html(data)
