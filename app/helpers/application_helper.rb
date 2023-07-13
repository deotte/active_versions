module ApplicationHelper
  def shared_select_box(form_obj, key, select_options)
    render("shared/shared_select_box", form_obj: form_obj, key: key, select_options: select_options)
  end

  def shared_text_input(form_obj, customer_obj, key, width, placeholder=nil)
    render("shared/shared_text_input", form_obj: form_obj, customer_obj: customer_obj, key: key, width: width, placeholder: placeholder)
  end

  def shared_checkbox_input(form_obj, key, custom_label)
    render("shared/shared_checkbox_input", form_obj: form_obj, key: key, custom_label: custom_label)
  end
end
