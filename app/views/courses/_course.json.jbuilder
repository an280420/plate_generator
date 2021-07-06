json.extract! course, :id, :name, :level, :volume, :template_id, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
