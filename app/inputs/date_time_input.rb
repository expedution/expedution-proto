class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    “#{@builder.text_field(attribute_name, input_html_options)}".html_safe
  end
end
