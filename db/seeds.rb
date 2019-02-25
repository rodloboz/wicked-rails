categories = %w[party bar beach lounge shopping cinema]

categories.each { |name| Category.create!(name: name) }
