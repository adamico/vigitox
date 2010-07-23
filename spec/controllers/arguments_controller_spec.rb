require 'spec_helper'
 
describe ArgumentsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Argument.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Argument.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Argument.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(argument_url(assigns[:argument]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Argument.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Argument.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Argument.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Argument.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Argument.first
    response.should redirect_to(argument_url(assigns[:argument]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    argument = Argument.first
    delete :destroy, :id => argument
    response.should redirect_to(arguments_url)
    Argument.exists?(argument.id).should be_false
  end
end
