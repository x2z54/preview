class StudentsController < ApplicationController

respond_to :html, :json

  helper_method :init_admin
  before_filter :init_admin

  def index
    @students = Student.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_with(@students)
  end

  def show
    @student = get_student(params[:id])
    respond_with(@student)
  end


  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
    @student = get_student(params[:id])
  end


  def create
    @student = Student.new(params[:student])
      if @student.save
        respond_with(@student, status: :created, location: students_url)
      else
        respond_with(@student) do |format|
          format.html { render action: "New" }
        end
      end
  end


  def update
    @student = get_student(params[:id])

      if @student.update_attributes(params[:student])
        respond_with(@student, status: :created, location: students_url)
      else
        respond_with(@student) do |format|
          format.html { render action: "Edit" }
        end
      end
  end


  def destroy
    @student = get_student(params[:id])
    @student.destroy
    respond_with(@student, location: students_url)
  end

  def give_access
    @room = Room.find(params[:room_id])
    @room.students << Student.find(params[:student_id])
    redirect_to :back
  end

  def remove_access
    @room = Room.find(params[:room_id])
    @room.students.delete(Student.find(params[:student_id]))
    redirect_to :back
  end

  private
  def get_student(student_id)
    Student.find(student_id)
  end

end
