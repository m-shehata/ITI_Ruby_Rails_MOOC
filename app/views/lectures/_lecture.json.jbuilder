json.extract! lecture, :id, :title, :content, :attachment, :course_id, :user, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
