class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count =  Subject.count + 1
  end

  def create
   @subject = Subject.new(subject_params)
   #save the object 
   if @subject.save 
    #if save succeeds, redirect to the index action
    flash[:notice] = 'subject created successfully'
    redirect_to(subjects_path)
   else 
    #if save fails, redisplay the form so user can fix the problems
    @subject_count =  Subject.count + 1
    render('new')
   end
  end

  def update 
    #Find a new object using form parameters
    @subject = Subject.find(params[:id])
   #update the object 
   if @subject.update(subject_params)
    #if save succeeds, redirect to the show action
    flash[:notice] = 'subject updated successfully'
    redirect_to(subject_path(@subject))
   else 
    #if save fails, redisplay the form so user can fix the problems
    @subject_count =  Subject.count
    render('edit')
   end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @subject_count =  Subject.count
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy 
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject #{@subject.name} destroyed successfully."
    redirect_to(subjects_path)
  end

  private 

  def subject_params 
    params.require(:subject).permit(:name, :position, :visible)
  end

end
