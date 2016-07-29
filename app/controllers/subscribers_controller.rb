class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy, :unsubscribe]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  skip_before_filter :authenticate_admin_user!, :only => [:create, :unsubscribe]
  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.all
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
    @subscribers_lists = SubscribersList.all.map { |e| [e.name, e.id] }
  end

  # GET /subscribers/1/edit
  def edit
    @subscribers_lists = SubscribersList.all
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to subscribers_path, notice: 'Suscriptor fue creado exitósamente.' }
        format.json { render json: @subscriber, status: :created }
      else
        flash[:error] = @subscriber.errors.full_messages.join(", ")
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to subscribers_path, notice: 'Suscriptor fue modificado exitósamente.' }
        format.json { render :index, status: :ok, location: @subscriber }
      else
        flash[:error] = @subscriber.errors.full_messages.join(", ")
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Suscriptor fue borrado exitósamente.' }
      format.json { head :no_content }
    end
  end

  def unsubscribe
    @subscriber.destroy
    render :layout => false
    # respond_to do |format|
    #   format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def import_subscribers
    counter = Subscriber.import_csv(params[:file])
    flash[:notice] = "Se han importado #{counter} nuevos usuarios."
    redirect_to subscribers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:first_name, :last_name, :email, :phone_number, :id_number, :subscribers_list_id)
    end
end
