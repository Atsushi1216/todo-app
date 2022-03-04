class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @user = current_user
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path #セーブ後indexページへ
    else
      render :new #条件分岐もしできなかったらnewページに留まる
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path #updateできたらindexページへ
    else
      render :edit #条件分岐もしできなかったらeditページのまま
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :body) #strong parameterでTaskモデルを作成した際にできたtaskテーブルにtitle(Todo)とbody(詳細)を保存。
  end

end
