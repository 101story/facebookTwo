require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post save" do
    post = Post.new({
      title: "post test",
      content: "post content",
      user_id: 1
      })
    assert post.save, 'Fail to save'
  end

  test "post length validation" do
    post = Post.new({
      title: Faker::Lorem.paragraph(sentence_count=10),
      content: Faker::Lorem.paragraph(sentence_count=10),
      user_id: 1
    })
    #assert !post.save, 'validation success'
    assert_not post.save, 'validation success'
    #refute post.save, 'validation success'
  end
end
