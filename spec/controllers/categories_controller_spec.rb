require 'spec_helper'
 
describe CategoriesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Categorie.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Categorie.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Categorie.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(categorie_url(assigns[:categorie]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Categorie.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Categorie.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Categorie.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Categorie.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Categorie.first
    response.should redirect_to(categorie_url(assigns[:categorie]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    categorie = Categorie.first
    delete :destroy, :id => categorie
    response.should redirect_to(categories_url)
    Categorie.exists?(categorie.id).should be_false
  end
end
