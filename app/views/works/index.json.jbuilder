json.array!(@works) do |work|
	json.id work.id
	json.parent work.parent.nil? ? "#" : work.parent.id
	json.text work.name
	json.type 'd' + work.depth.to_s
end
