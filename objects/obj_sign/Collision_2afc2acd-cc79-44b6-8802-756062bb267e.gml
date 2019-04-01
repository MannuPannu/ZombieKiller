if(!instance_exists(obj_text)){
	var textSign = instance_create_layer(x, y-64, layer, obj_text);
	
	with(textSign){
		text = other.text;
		length = string_length(text);
	}
}
