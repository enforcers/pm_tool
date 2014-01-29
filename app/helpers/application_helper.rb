module ApplicationHelper
  def project_list_link(current, project)
  	class_name = current == project ? 'active' : ''

  	content_tag(:li, :class => class_name) do
  	  link_to content_tag(:span, ' ', :class => "delete-project badge pull-right glyphicon glyphicon-remove", :'data-project' => project.id) + project.name, project_products_path(project)
  	end
  end

  def project_nav_link(link_text, link_path)
  	class_name = current_page?(link_path) ? 'active' : ''

  	content_tag(:li, :class => class_name) do
  	  link_to link_text, link_path
  	end
  end
end
