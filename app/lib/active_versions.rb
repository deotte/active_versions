module ActiveVersions
  def create_versioned_record(persisted_object)
    version_history_class = "#{persisted_object.class.name.downcase}_versions"
    new_version = Hash.new

    puts persisted_object.previous_changes.inspect

    persisted_object.previous_changes.each do |key, changes|
      next if key == ("updated_at" || "created_at")
      new_version[key] = changes.last
    end

    puts new_version.inspect

    persisted_object.send(version_history_class).create!(new_version)
  end
end