class StudentsController < ApplicationController
  # GET /students
  def index
    students = Student.page(params[:page]).per(params[:count])

    paginate json: students, 
             root: "items",
             meta: params[:page].to_i,
             meta_key: "page",
             adapter: :json,
             each_serializer: StudentsSerializer
  end

  # POST /students
  def create
    student = Student.new student_params

    if student.save
      render json: { id: student.id }, 
             status: :created             
    else 
      render json: { errors: student.errors }, 
             status: :unprocessable_entity
    end   
  end

  private 

  def student_params
    params.require(:student)
          .permit(:name, :cpf, :birthdate, :payment_method)    
  end
end
