class GoalsController < ApplicationController

def new
  @goal = Goal.new
end

def create
  @goal = Goal.new(goal_params)
  @goal.user_id = current_user.id

  if @goal.save
    log_in(@goal)
    redirect_to goal_url(@goal)
  else
    flash.now[:errors] = @goal.errors.full_messages
    render :new
  end
end

def show
end

def edit
end

def update
  @goal = Goal.find(params[:id])

  if @goal.update_attributes(goal_params)
    log_in(@goal)
    redirect_to goal_url(@goal)
  else
    flash.now[:errors] = @goal.errors.full_messages
    render :new
  end
end

def destroy
end

private

def goal_params
  params.require(:goal).permit(:title, :status, :privacy)
end
end
