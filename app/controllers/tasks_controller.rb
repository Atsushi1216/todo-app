class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      #セーブ後indexページへ
      redirect_to tasks_path
    else
      #できなかったらnewページに留まる
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      #updateできたらindexページへ
      redirect_to tasks_path
    else
      #できなかったらeditページのまま
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
　　#strong parameter でTaskモデルを作成した際にできたtaskテーブルにtitle(やること)とbody(詳細)を保存。
    params.require(:task).permit(:title, :body)
  end

end
