module ApplicationHelper

  def sortable(column)
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to column.titleize, sort: column, direction: direction
  end

end
