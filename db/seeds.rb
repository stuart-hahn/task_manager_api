# Find or create teams
team_a = Team.find_or_create_by(name: "Remote Team A")
team_b = Team.find_or_create_by(name: "Remote Team B")

# Find or create users
user1 = User.find_or_create_by(email: "alice@example.com") do |user|
  user.name = "Alice"
  user.password = "password"
  user.team = team_a
end

user2 = User.find_or_create_by(email: "bob@example.com") do |user|
  user.name = "Bob"
  user.password = "password"
  user.team = team_b
end

# Creating tasks for Team A
Task.create!(title: "Task 1", description: "Complete this task.", status: "To-Do", due_date: 1.week.from_now, user: user1, team: team_a)
Task.create!(title: "Task 2", description: "Another task for Alice.", status: "In Progress", due_date: 2.days.from_now, user: user1, team: team_a)

# Creating tasks for Team B
Task.create!(title: "Task 3", description: "Task assigned to Bob.", status: "To-Do", due_date: 1.week.from_now, user: user2, team: team_b)
Task.create!(title: "Task 4", description: "Another task for Bob.", status: "Done", due_date: 1.day.from_now, user: user2, team: team_b)
