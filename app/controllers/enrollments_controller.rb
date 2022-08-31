class EnrollmentsController < BasicAuthController  
  # GET /enrollments
  def index
    enrollments = Enrollment.page(params[:page]).per(params[:count])

    paginate json: enrollments, 
             root: "items",
             meta: params[:page].to_i,
             meta_key: "page",
             adapter: :json,
             each_serializer: EnrollmentSerializer
  end

  # POST /enrollments
  def create
    enrollment = Enrollment.new enrollment_params

    if enrollment.save_and_generate_bills
      render json: enrollment,             
             status: :created             
    else 
      render json: { errors: enrollment.errors }, 
             status: :unprocessable_entity
    end   
  end

  private 

  def enrollment_params
    params.require(:enrollment)
          .permit(:amount, :installments, :due_day, :student_id)        
  end
end
