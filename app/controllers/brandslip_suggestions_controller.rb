class BrandslipSuggestionsController < ApplicationController
  layout "brandslip_layout"
  before_filter :is_profile_complete

  # GET /brandslip_suggestions/1
  # GET /brandslip_suggestions/1.json
  def show
    @brandslip_suggestion = BrandslipSuggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brandslip_suggestion }
    end
  end

  # GET /brandslip_suggestions/new
  # GET /brandslip_suggestions/new.json
  def new
    @brandslip_suggestion = BrandslipSuggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brandslip_suggestion }
    end
  end

  # GET /brandslip_suggestions/1/edit
  def edit
    @brandslip_suggestion = BrandslipSuggestion.find(params[:id])
  end

  # POST /brandslip_suggestions
  # POST /brandslip_suggestions.json
  def create
    @brandslip_suggestion = BrandslipSuggestion.new(params[:brandslip_suggestion])

    respond_to do |format|
      if @brandslip_suggestion.save
        format.html { redirect_to @brandslip_suggestion, notice: 'Brandslip suggestion was successfully created.' }
        format.json { render json: @brandslip_suggestion, status: :created, location: @brandslip_suggestion }
      else
        format.html { render action: "new" }
        format.json { render json: @brandslip_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brandslip_suggestions/1
  # PUT /brandslip_suggestions/1.json
  def update
    @brandslip_suggestion = BrandslipSuggestion.find(params[:id])

    respond_to do |format|
      if @brandslip_suggestion.update_attributes(params[:brandslip_suggestion])
        format.html { redirect_to @brandslip_suggestion, notice: 'Brandslip suggestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brandslip_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brandslip_suggestions/1
  # DELETE /brandslip_suggestions/1.json
  def destroy
    @brandslip_suggestion = BrandslipSuggestion.find(params[:id])
    @brandslip_suggestion.destroy

    respond_to do |format|
      format.html { redirect_to brandslip_suggestions_url }
      format.json { head :no_content }
    end
  end
  
  def delete_suggestion
   Rails.logger.debug("#{params[:suggestion_id]}")
   BrandslipSuggestion.delete_all("id=#{params[:suggestion_id]}")
   
#   @delete_job_notifications = UserJobProposal.find_by_sql("select distinct user_id from user_job_proposals where job_id=#{params[:job_id]}")
#   @delete_job_notifications.each do |job|
#     presenter = Job.find(params[:job_id])
#     presenter_user = User.where(:id => presenter.job_user_id)
#     presenter_full_name = "#{presenter_user[0].first_name} #{presenter_user[0].last_name}"
#     user = User.where(:id => job.user_id)
#     brand_full_name = "#{user[0].first_name} #{user[0].last_name}"
#     UserMailer.delete_job_notification(user[0].email,brand_full_name, presenter_full_name, job.job_title).deliver
#   end        
#   UserJobProposal.delete_all("job_id=#{params[:job_id]}")
   render :json => {}
  end  
end
