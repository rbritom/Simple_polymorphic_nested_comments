require 'test_helper'

class ProyectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Proyect.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Proyect.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Proyect.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to proyect_url(assigns(:proyect))
  end
  
  def test_edit
    get :edit, :id => Proyect.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Proyect.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Proyect.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Proyect.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Proyect.first
    assert_redirected_to proyect_url(assigns(:proyect))
  end
  
  def test_destroy
    proyect = Proyect.first
    delete :destroy, :id => proyect
    assert_redirected_to proyects_url
    assert !Proyect.exists?(proyect.id)
  end
end
