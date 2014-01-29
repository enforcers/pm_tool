json.array!(@products) do |product|
	json.id product.id
	json.parent product.parent.nil? ? "#" : product.parent.id
	json.text product.name
	json.type 'd' + product.depth.to_s
end
