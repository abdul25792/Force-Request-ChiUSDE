class StudentRequestsController < ApplicationController

  # before_filter CASClient::Frameworks::Rails::Filter
  
  def student_request_params
    params.require(:student_request).permit(:request_id, :uin, :full_name, :major , :classification, :minor, :email, :phone, :expected_graduation, :request_semester, :course_id, :section_id, :notes, :state )
  end

  # def show
  #   req = params[:request_id] # retrieve request ID from URI route
  #   @student_request = StudentRequest.find(req) # look up request by unique ID
  #   # will render app/views/student_requests/show.<extension> by default
  # end

  def index
    @student_requests = StudentRequest.where(:uin => session[:uin])
  end

  def new
    # default: render 'new' template
  end
  
  
  def cancel
    
  end

  def create
    @student_request = StudentRequest.new(student_request_params)
    @student_request.state = StudentRequest::ACTIVE_STATE
    @student_request.save!
    flash[:notice] = "Student Request was successfully created."
    redirect_to student_requests_path
  end
  
  def update
    @student_request = StudentRequest.find params[:id]
    @student_request.state = StudentRequest::WITHDRAWN_STATE
    @student_request.save!
    flash[:notice] = "Student Request was successfully deleted."
    redirect_to student_requests_path
  end
  
  def edit
    @student_request = StudentRequest.find params[:id]
    @student_request.state = StudentRequest::WITHDRAWN_STATE
    @student_request.save!
    flash[:notice] = "Student Request was successfully deleted."
    redirect_to student_requests_path
  end


  def destroy
    @student_request = StudentRequest.find(params[:id])
    @student_request.destroy
    flash[:notice] = "Request '#{@student_request.request_id}' deleted."
    redirect_to student_requests_path
  end
  
  def adminview
    @allAdminStates = [" ",StudentRequest::APPROVED_STATE, StudentRequest::REJECTED_STATE, StudentRequest::HOLD_STATE]
    @allcourses = StudentRequest.select(:course_id).map(&:course_id).uniq
    @coursestudentlist = Hash.new
   
    @allcourses.each do |course|
      @students = StudentRequest.where(course_id: course).where.not(state: StudentRequest::WITHDRAWN_STATE)
      if (params[:state_sel] != nil)
        @students = @students.reject{ |s| !params[:state_sel].has_key?(s.state) }
      end
      @coursestudentlist[course] = @students
    end
    
    @selected = {}
    
    @all_states = [StudentRequest::ACTIVE_STATE, StudentRequest::REJECTED_STATE, StudentRequest::APPROVED_STATE, StudentRequest::HOLD_STATE]
    @all_states.each { |state|
      if params[:state_sel] == nil
        @selected[state] = true
      else
        @selected[state] = params[:state_sel].has_key?(state)
      end
    }
  end
  
  def updaterequestbyadmin
    @student_request = StudentRequest.find params[:id]
    if(params[:state] != " ")
      @student_request.state = params[:state]
      @student_request.admin_notes = params[:notes_for_myself]
      @student_request.notes_to_student = params[:notes_for_student]
      @student_request.save!
      flash[:notice] = "The request was successfully updated to " + @student_request.state
    else
       flash[:notice] = "Please Select Appropriate action " 
    end
    redirect_to student_requests_adminview_path
  end
  
  def login
    session[:uin] = params[:session][:uin]
    list_of_admin_uins = ['123', '234', '345']
    if list_of_admin_uins.include? session[:uin]
      redirect_to student_requests_adminview_path
    else
      redirect_to student_requests_path
    end
  end
end