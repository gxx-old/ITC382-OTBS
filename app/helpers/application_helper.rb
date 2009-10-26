# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def set_title(title, create_heading = true)
    content_for :title do
      title
    end
    render :inline => "<h1>#{title}</h1>" if create_heading
  end

  def form_table(&proc)
    concat('<table class="formtable">' + capture(&proc) + '</table>')
  end

  def form_input(input_controller, input_for, input_name, input_field)
    table_element label(input_controller, input_for, input_name), input_field
  end

  def table_element(title,element)
    render :inline => "<tr><th>#{title}</th><td>#{element}</td></tr>"
  end
end
