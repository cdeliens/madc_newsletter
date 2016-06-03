class SubscribersListsController < ApplicationController
  before_action :set_subscribers_list, only: [:show, :edit, :update, :destroy]

  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers_lists = SubscribersList.all
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscribers_list = SubscribersList.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscribers_list = SubscribersList.new(subscribers_list_params)

    respond_to do |format|
      if @subscribers_list.save
        format.html { redirect_to @subscribers_list, notice: 'Subscriber was successfully created.' }
        format.json { render :index, status: :created, location: @subscribers_list }
      else
        format.html { render :new }
        format.json { render json: @subscribers_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscribers_list.update(subscribers_list_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :index, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscribers_list.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscribers List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribers_list
      @subscribers_list = SubscribersList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribers_list_params
      params.require(:subscribers_list).permit(:name)
    end
end
