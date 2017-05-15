require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  setup do
    @lecture = lectures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lectures)
  end

  test "only admin can delete course" do
    student = users(:user_1)
    instructor = users(:user_11)
    admin = users(:user_21)
    ability_student = Ability.new(student)
    ability_instructor = Ability.new(instructor)
    ability_admin = Ability.new(admin)
    assert ability_student.cannot?(:destroy, Course.new(:title => "title"))
    assert ability_instructor.cannot?(:destroy, Course.new(:title => "title"))
    assert ability_admin.can?(:destroy, Course.new(:title => "title"))
  end

  test "should instructor create lecture" do
    assert_difference('Lecture.count') do
      instructor = users(:user_11)
      #not working authentication although written in DOCS
      # current_user = admin
      # session[:user_id] = user.id # log in user however you like, alternatively stub `current_user` method

      sign_in instructor
      puts @lecture.content
      puts @lecture.attachment
      post :create, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id, title: @lecture.title, user_id: @lecture.user_id }
      # puts response.status

      assert_response :redirect
    end

    assert_redirected_to lecture_path(assigns(:lecture))
  end

# test "should show lecture" do
# get :show, id: @lecture
# assert_response :success
# end
#
# test "should get edit" do
# get :edit, id: @lecture
# assert_response :success
# end
#
# test "should update lecture" do
# patch :update, id: @lecture, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id, title: @lecture.title, user: @lecture.user }
# assert_redirected_to lecture_path(assigns(:lecture))
# end
#
# test "should destroy lecture" do
# assert_difference('Lecture.count', -1) do
# delete :destroy, id: @lecture
# end
#
# assert_redirected_to lectures_path
# end
end
