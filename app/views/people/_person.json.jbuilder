json.extract! person, :id, :name, :age, :job, :bio, :created_at, :updated_at
json.url person_url(person, format: :json)
