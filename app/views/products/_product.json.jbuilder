json.id product.id
json.parent product.parent.nil? ? "#" : product.parent.id
json.text product.name
json.type product.depth