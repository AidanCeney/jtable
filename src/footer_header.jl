function add_footer_or_title(dt::RTFTable.DataTable,footer::Bool, text::String, font::Union{String,Nothing}, font_size::Int)
    
    font = isnothing(font) ? dt.global_properties["fonts"][1] : font
    ncol = length(dt.property_matrix[1])
    row_pos = footer ? length(dt.property_matrix) : 0
    new_row = repeat([""],ncol)
    new_row[1] = text
    add_row(dt,new_row,position = row_pos)
    row_n = footer ? length(dt.property_matrix) : 1
    merge_cols!(dt,rows = row_n)
    set_font!(dt, font, rows = row_n)
    set_font!_size!(dt, font_size, rows = row_n)
    return 
end

function add_footer!(dt::RTFTable.DataTable, text; font::Union{String, Nothing} = Nothing(),font_size::Int = 8)
    add_footer_or_title(dt, true, text, font, font_size)
    return 
end

function add_title!(dt::RTFTable.DataTable, text::String; font::Union{String, Nothing} = Nothing(),font_size::Int = 14)
    add_footer_or_title(dt, false, text, font, font_size)
    return 
end