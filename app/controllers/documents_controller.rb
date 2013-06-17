class DocumentsController < ApplicationController
  include DocumentsHelper

  helper_method :init_admin
  before_filter :init_admin

  def index
    @user = current_user
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
    @room = Room.find(params[:room_id])
  end

  def create
    doc = params['document']
    data = drive_upload(doc['link'], doc['name'])
    @room = Room.find(params[:room_id])
    @document = @room.documents.new(name: doc['name'], link: data.alternate_link)

    if @document.save
      redirect_to @room, notice: 'Document was successfully created! \o/'
    else
      render action: "new", notice: 'There was some kind of error.'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_url
  end

end
