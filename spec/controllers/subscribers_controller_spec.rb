# require 'rails_helper'
#
# RSpec.describe SubscribersController, type: :controller do
#
#   let(:valid_attributes) {
#     {first_name: "Bob",
#      last_name: "Brenes",
#      email: "fake@mailinator.com",
#      id_number: "10101010101",
#      phone_number: "124"
#     }
#   }
#
#   let(:invalid_attributes) {
#     {first_name: 123,
#      last_name: "Brenes",
#      email: "fake@mailinatorcom",
#      phone_number: "124"
#     }
#   }
#
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "assigns all subscribers as @subscribers" do
#       subscriber = Subscriber.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:subscribers)).to eq([subscriber])
#     end
#   end
#
#   describe "GET #show" do
#     it "assigns the requested subscriber as @subscriber" do
#       subscriber = Subscriber.create! valid_attributes
#       get :show, {:id => subscriber.to_param}, valid_session
#       expect(assigns(:subscriber)).to eq(subscriber)
#     end
#   end
#
#   describe "GET #new" do
#     it "assigns a new subscriber as @subscriber" do
#       get :new, {}, valid_session
#       expect(assigns(:subscriber)).to be_a_new(Subscriber)
#     end
#   end
#
#   describe "GET #edit" do
#     it "assigns the requested subscriber as @subscriber" do
#       subscriber = Subscriber.create! valid_attributes
#       get :edit, {:id => subscriber.to_param}, valid_session
#       expect(assigns(:subscriber)).to eq(subscriber)
#     end
#   end
#
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Subscriber" do
#         expect {
#           post :create, {:subscriber => valid_attributes}, valid_session
#         }.to change(Subscriber, :count).by(1)
#       end
#
#       it "assigns a newly created subscriber as @subscriber" do
#         post :create, {:subscriber => valid_attributes}, valid_session
#         expect(assigns(:subscriber)).to be_a(Subscriber)
#         expect(assigns(:subscriber)).to be_persisted
#       end
#
#       it "redirects to the created subscriber" do
#         post :create, {:subscriber => valid_attributes}, valid_session
#         expect(response).to redirect_to(Subscriber.last)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns a newly created but unsaved subscriber as @subscriber" do
#         post :create, {:subscriber => invalid_attributes}, valid_session
#         expect(assigns(:subscriber)).to be_a_new(Subscriber)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, {:subscriber => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) { { first_name: "NewName" } }
#
#       it "updates the requested subscriber" do
#         subscriber = Subscriber.create! valid_attributes
#         put :update, {:id => subscriber.to_param, :subscriber => new_attributes}, valid_session
#         subscriber.reload
#         expect(subscriber.first_name).to eq new_attributes[:first_name]
#       end
#
#       it "assigns the requested subscriber as @subscriber" do
#         subscriber = Subscriber.create! valid_attributes
#         put :update, {:id => subscriber.to_param, :subscriber => valid_attributes}, valid_session
#         expect(assigns(:subscriber)).to eq(subscriber)
#       end
#
#       it "redirects to the subscriber" do
#         subscriber = Subscriber.create! valid_attributes
#         put :update, {:id => subscriber.to_param, :subscriber => valid_attributes}, valid_session
#         expect(response).to redirect_to(subscriber)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the subscriber as @subscriber" do
#         subscriber = Subscriber.create! valid_attributes
#         put :update, {:id => subscriber.to_param, :subscriber => invalid_attributes}, valid_session
#         expect(assigns(:subscriber)).to eq(subscriber)
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested subscriber" do
#       subscriber = Subscriber.create! valid_attributes
#       expect {
#         delete :destroy, {:id => subscriber.to_param}, valid_session
#       }.to change(Subscriber, :count).by(-1)
#     end
#
#     it "redirects to the subscribers list" do
#       subscriber = Subscriber.create! valid_attributes
#       delete :destroy, {:id => subscriber.to_param}, valid_session
#       expect(response).to redirect_to(subscribers_url)
#     end
#   end
#
# end
