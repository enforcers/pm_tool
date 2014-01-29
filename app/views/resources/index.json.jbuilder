json.array!(@resources) do |resource|
	json.id resource.id
#	json.parent resource.parent.nil? ? "#" : resource.parent.id
	json.text resource.name
#	json.type resource.depth
end
