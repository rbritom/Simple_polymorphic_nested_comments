require 'test_helper'

class ProyectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Proyect.new.valid?
  end
end
