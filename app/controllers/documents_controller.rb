class DocumentsController < ApplicationController
  include DocumentsHelper

  def index
    @user = current_user
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    doc = params['document']
    data = drive_upload(doc['link'], doc['name'])
    @document = Document.new(name: doc['name'], link: data.alternate_link)

    if @document.save
      redirect_to @document, notice: 'Document was successfully created! \o/'
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
