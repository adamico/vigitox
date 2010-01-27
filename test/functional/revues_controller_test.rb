require 'test_helper'

class RevuesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Revue.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Revue.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Revue.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to revue_url(assigns(:revue))
  end
  
  def test_edit
    get :edit, :id => Revue.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Revue.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Revue.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Revue.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Revue.first
    assert_redirected_to revue_url(assigns(:revue))
  end
  
  def test_destroy
    revue = Revue.first
    delete :destroy, :id => revue
    assert_redirected_to revues_url
    assert !Revue.exists?(revue.id)
  end
end
