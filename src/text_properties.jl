function fs(str_matrix,value,i,j)
	str_matrix[i][j][2] = str_matrix[i][j][2] * "\\fs" * value 
end

function set_font_size(dt,font_size;rows = Nothing(),cols = Nothing())
	
	font_size = string(font_size*2)
	property_matrix = dt.property_matrix
	value_matrix    = dt.value_matrix
	set_values(value_matrix,"fs",font_size,rows,cols)
	return
end

function left_align(str_matrix,value,i,j)
	str_matrix[i][j][2] = str_matrix[i][j][2] * "\\ql"  
end

function right_align(str_matrix,value,i,j)
	str_matrix[i][j][2] = str_matrix[i][j][2] * "\\qr" 
end

function center_align(str_matrix,value,i,j)
	str_matrix[i][j][2] = str_matrix[i][j][2] * "\\qc"  
end

function justify_align(str_matrix,value,i,j)
	str_matrix[i][j][2] = str_matrix[i][j][2] * "\\qj" 
end

function set_alignment(dt,align;rows = Nothing(),cols = Nothing())

	property_matrix = dt.property_matrix
	value_matrix    = dt.value_matrix
	for a in ["left","right","center","justify"]
		set_properties(property_matrix,a*"_align",false,rows,cols)
	end
	set_properties(property_matrix,align*"_align",true,rows,cols)
end
	

