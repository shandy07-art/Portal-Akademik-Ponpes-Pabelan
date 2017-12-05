require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "apakah bisa melihat form login" do
    get admin_url
    assert_response :success
  end

  test "login admin with invalid information" do
    get admin_path
    assert_template 'admin/login'
    post admin_path, params: { admin: { username: "", password: "" } }
    assert_template 'admin/login'
    assert_not flash.empty?
    get admin_index_path
    assert_not flash.empty?
  end

  test "login with valid information" do
    get admin_path
    post admin_path, params: { admin: { username: 'admin',
                                          password: 'admin' } }
    get admin_path
    assert_response :success
  end

#  test "valid add guru information" do
#    assert_difference 'Guru.count', 0 do
#      post admin_guru_path, params: { guru: { username: 'sample',
#      									 password: 'sample',
#      									 nama: 	   'sample',
#      									 nip:      '123456',
#      									 jk: 	     'Pria',
#      									 ttl:      '1998-09-04',
#      									 alamat:   'banten',
#      									 no_tlp:   '0834567876',
#      									 mapel:    'Kimia',
#      									 pendidikan:'MA' } }
#    end
#    assert_redirected_to admin_guru_path
#    assert is_logged_in?
#  end

end
