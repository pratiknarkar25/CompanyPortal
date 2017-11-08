class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    binding.pry
    current_user.email == "pratik.narkar@synerzip.com"
  end

  def update?
    user.admin? or not post.published?
  end
end
