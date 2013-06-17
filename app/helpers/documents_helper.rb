require 'mime/types'

module DocumentsHelper

  SERVICE_EMAIL = '561310815004@developer.gserviceaccount.com'
  SERVICE_KEYFILE = File.join(Rails.root, 'config', '9fd530132a200cf2598fd2b842e4b58b297ea1ce-privatekey.p12')

  def build_client
    key = Google::APIClient::PKCS12.load_key(SERVICE_KEYFILE, 'notasecret')
    asserter = Google::APIClient::JWTAsserter.new(SERVICE_EMAIL,
        'https://www.googleapis.com/auth/drive', key)
    client = Google::APIClient.new
    client.authorization = asserter.authorize()
    client
  end

  def drive_upload(file_info, file_name)
    temp_file = file_info.tempfile.path
    mime = file_info.content_type

    client = build_client
    drive = client.discovered_api("drive", "v2")

    file = drive.files.insert.request_schema.new(
      title: file_name,
      description: 'New file',
      mimeType: mime)

    media = Google::APIClient::UploadIO.new(
      File.expand_path(temp_file),
      'binary/octet-stream')

    file_result = client.execute(
      api_method: drive.files.insert,
      body_object: file,
      media: media,
      parameters: {
        'uploadType' => 'multipart',
        'alt' => 'json'})
    logger.debug "An error occurred: #{file_result.data['error']['message']}" unless file_result.status == 200

    permission = drive.permissions.insert.request_schema.new({
      'type' => 'anyone',
      'role' => 'reader'})

    permission_result = client.execute(
      api_method: drive.permissions.insert,
      body_object: permission,
      parameters: { 'fileId' => file_result.data.id })
    logger.debug "An error occurred: #{permission_result.data['error']['message']}" unless permission_result.status == 200

    new_parent = drive.parents.insert.request_schema.new({
      'id' => '0Bz-gNMVeBW-JZjlhOVlIUlFBaTQ'
    })

    parent_result = client.execute(
      :api_method => drive.parents.insert,
      :body_object => new_parent,
      :parameters => { 'fileId' => file_result.data.id })
    logger.debug "An error occurred: #{parent_result.data['error']['message']}" unless parent_result.status == 200


    file_result.data
  end
end
