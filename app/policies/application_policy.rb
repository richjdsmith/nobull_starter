class ApplicationPolicy 
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "Must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin? || @user == @record.user
  end

  def create?
    @user.admin?
  end

  def new?
    create?
  end

  def update?
    @user.admin? || @user == @record.user
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
