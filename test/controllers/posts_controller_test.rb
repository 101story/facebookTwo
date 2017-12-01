require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    # 실행전에 post 를 지정해줌
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new #url 이 작동하는지 확인
    assert_response :success
  end

  #댓글 잘 달라지는지 알아봄
  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { content: @post.content, title: @post.title, user_id: @post.user_id }
    end

    assert_redirected_to post_path(assigns(:post))

    #ajax 를 해서 redirect_to 가 없어됨

  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { content: @post.content, title: @post.title, user_id: @post.user_id }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end

  # #댓글 잘 달라지는지 알아봄 댓글 테스트 코드 추가
  # test "should create comment" do
  #   assert_difference('comment.count') do
  #     comment :create, comment: { content: @post.content, user_id: @post.user_id }
  #   end
  #
  #   assert_redirected_to post_path(assigns(:post))
  #
  #   #ajax 를 해서 redirect_to 가 없어됨
  #
  # end
end
