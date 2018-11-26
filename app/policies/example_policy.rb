class ExamplePolicy < ApplicationPolicy
  # It's empty here for a reason. That's because if you set
  # your controller up the right way, you shouldn't need
  # to override the application policy/
  # Here's what that controller should look like.
  # ...
  # def index
  #   @locations = policy_scope(Location)
  #   skip_authorization
  # end
  # def show
  #   authorize @location
  # end
  # ...
end