require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create(name: "Test Team")
    @user = User.create(name: "John Doe", email: "john@example.com", password: "password", team: @team)
    @task = Task.create(title: "Test Task", description: "Task description", status: "To-Do", due_date: 1.day.from_now, user: @user, team: @team)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { title: "New Task", description: "New task description", status: "To-Do", due_date: 1.day.from_now, user_id: @user.id, team_id: @team.id } }
    end
    assert_response :created
  end

  test "should update task" do
    patch task_url(@task), params: { task: { status: "Done" } }
    assert_response :success
    @task.reload
    assert_equal "Done", @task.status
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end
    assert_response :no_content
  end
end
