class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy, :send_campaign]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
    @subscribers_lists = SubscribersList.all.map { |e| [e.name, e.id] }
    @templates = Template.all.map { |e| [e.title, e.id] }
  end

  # GET /newsletters/1/edit
  def edit
    @templates = Template.all.map { |e| [e.title, e.id] }
    @subscribers_lists = SubscribersList.all.map { |e| [e.name, e.id] }
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to newsletters_path, notice: 'Newsletter fue creado exitósamente.' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        flash[:error] = @newsletter.errors.full_messages.join(", ")
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to newsletters_path, notice: 'Newsletter fue modificado exitósamente.' }
        format.json { render :show, status: :ok, location: @newsletter }
      else
        flash[:error] = @newsletter.errors.full_messages.join(", ")
        format.html { render :edit }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter fue borrado exitósamente.' }
      format.json { head :no_content }
    end
  end

  def send_campaign
    @newsletter.subscribers_list.subscribers.each { |e| NewsletterMailer.send_campaign(@newsletter, e).deliver }
    @newsletter.touch
    NewsletterLog.create( newsletter: @newsletter.name, user: current_admin_user.email, emails: @newsletter.subscribers_list.subscribers.count, send_at: DateTime.now, template: @newsletter.template.title)
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Campaña enviada exitósamente' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:name, :subscribers_list_id, :template_id)
    end
end
