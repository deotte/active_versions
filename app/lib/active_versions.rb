module ActiveVersions
  def create_versioned_record(persisted_object)
    version_history_class = "#{persisted_object.class.name.downcase}_versions"
    non_versioned_attributes = persisted_object.class.const_get('NON_VERSIONED_ATTRIBUTES')
    new_version = Hash.new

    persisted_object.previous_changes.each do |key, changes|
      next if key == ("updated_at" || "created_at") || non_versioned_attributes.include?(key)
      new_version[key] = changes.last
    end

    persisted_object.send(version_history_class).create!(new_version)
  end
end