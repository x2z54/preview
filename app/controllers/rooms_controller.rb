class RoomsController < ApplicationController
  respond_to :html, :json

  helper_method :init_admin
  before_filter :init_admin, except: :show

  def index
    @rooms = Room.all
    respond_with(@rooms)
  end

  def show
    @user = User.find(session[:user_id])
    @room = get_room(params[:id])
    @student = @room.students.find_by_email(current_user.email)
    if @student
      @chat_messages = ChatMessage.get_room_messages(params[:id])
      respond_with(@room)
    else
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end

   def new
    @room = Room.new
    @students = Student.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_with(@room)
  end


  def edit
    @room = get_room(params[:id])
    @students = Student.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_with(@room)
  end


  def create
    @room = Room.new(params[:room])
      if @room.save
        respond_with(@room, status: :created, location: @room)
      else
        respond_with(@room) do |format|
          format.html { render action: "New" }
        end
      end
  end


  def update
    @room = get_room(params[:id])
      if @room.update_attributes(params[:room])
        respond_with(@room, status: :created, location: @room)
      else
        respond_with(@room) do |format|
          format.html { render action: "Edit" }
        end
      end
  end

  def destroy
    @room = get_room(params[:id])
    @room.destroy
    respond_with(@room, location: rooms_url)
  end

  private
  def get_room(room_id)
    Room.find(room_id)
  end

end
