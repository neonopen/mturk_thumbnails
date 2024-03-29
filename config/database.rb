postgres = URI.parse(ENV['DATABASE_URL'] || '')

ActiveRecord::Base.configurations[:development] = {
  :adapter => 'postgresql',
  :encoding  => 'utf8',
   :database  => 'mturk_thumbnails-dev',
  #:database => 'august_9',
  :username  => 'postgres',
  :host      => 'localhost'
}

ActiveRecord::Base.configurations[:production] = {
  :adapter  => 'postgresql',
  :encoding => 'utf8',
  :database => postgres.path[1..-1],
  :username => postgres.user,
  :password => postgres.password,
  :host     => postgres.host
}

# Connect to the production database, but we don't need to be in the
# Heroku environment.
ActiveRecord::Base.configurations[:remote_production] = {
  :adapter  => 'postgresql',
  :encoding => 'utf8',
  :database => 'demek58s78bbkn',
  :username => 'zogqtvlfduwuiy',
  :password => 'WHLuEoq7zS26xZPutJlLQA487Y',
  :host     => 'ec2-54-197-241-67.compute-1.amazonaws.com',
  :port     => 5432
}

# Connect to the staging database, but we don't need to be in the
# Heroku environment.
ActiveRecord::Base.configurations[:remote_staging] = {
  :adapter  => 'postgresql',
  :encoding => 'utf8',
  :database => 'd6kgo1cd8j469q',
  :username => 'nzqjrjpftscjev',
  :password => 'QldrAVGgp7PeKLX3WwJgeK2JIS',
  :host     => 'ec2-54-221-204-45.compute-1.amazonaws.com',
  :port     => 5432
}

# Setup our logger
ActiveRecord::Base.logger = logger

# Raise exception on mass assignment protection for Active Record models
ActiveRecord::Base.mass_assignment_sanitizer = :strict

# Log the query plan for queries taking more than this (works
# with SQLite, MySQL, and PostgreSQL)
ActiveRecord::Base.auto_explain_threshold_in_seconds = 0.5

# Include Active Record class name as root for JSON serialized output.
ActiveRecord::Base.include_root_in_json = false

# Store the full class name (including module namespace) in STI type column.
ActiveRecord::Base.store_full_sti_class = true

# Use ISO 8601 format for JSON serialized times and dates.
ActiveSupport.use_standard_json_time_format = true

# Don't escape HTML entities in JSON, leave that for the #json_escape helper.
# if you're including raw json in an HTML page.
ActiveSupport.escape_html_entities_in_json = false

# Now we can estabilish connection with our db
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Padrino.env])
