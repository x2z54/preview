client = new Faye.Client('/faye')



format_date = (date) ->
  force_two_digits = (val) ->
    if val < 10 then "0#{val}" else val
  hour = force_two_digits(date.getHours())
  minute = force_two_digits(date.getMinutes())
  second = force_two_digits(date.getSeconds())
  return "#{hour}:#{minute}:#{second}"


client.subscribe '/chat', (payload)->
  # You probably want to think seriously about XSS here:
  $('#chat').append(
    "<li>#{payload.message}<span class='created_at'>#{payload.created_at}</span></li>")
$(document).ready ->
  input = $('.chatmsg')
  button = $('.chatpost')
  post_action = ->
    button.attr('disabled', 'disabled')
    #button.text('Posting...')
    publication = client.publish '/chat',
      message: input.val()
      created_at: format_date(new Date())
    publication.callback ->
      input.val('')
      button.removeAttr('disabled')
      #button.text('Post')
    publication.errback ->
      button.removeAttr('disabled')
      #button.text('Try again')

  button.on 'click', post_action
  input.on 'keydown', (key) -> post_action() if key.which == 13

window.client = client