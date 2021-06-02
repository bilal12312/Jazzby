class ProductPolicy  < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end
  def edit?
    user.admin?
  end
  def update?
    user.admin?
  end
  def create?
  	user.admin?
  end
  def destroy?
  	user.admin?
  end
  
end