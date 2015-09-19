module ButtonsHelper

  def actions_group(*btns)
    content_tag :div, class: 'actions-group' do
      btns.join.html_safe
    end
  end

  def img_btn_to(path, h_options = {})
    link_to '', path, h_options
  end

  def show_btn(path, h_options = {})
    h_options[:title] ||= 'show'
    h_options[:class] ||= 'show-btn'

    img_btn_to(path, h_options)
  end

  def edit_btn(path, h_options = {})
    h_options[:title] ||= 'edit'
    h_options[:class] ||= 'edit-btn'

    img_btn_to(path, h_options)
  end

  def delete_btn(path, h_options = {})
    h_options[:title] ||= 'delete'
    h_options[:method] ||= :delete
    h_options[:data] ||= {}
    h_options[:data][:confirm] ||= 'Are you sure?'
    h_options[:class] ||= 'delete-btn'

    img_btn_to(path, h_options)
  end

end
