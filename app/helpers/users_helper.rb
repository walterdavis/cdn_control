module UsersHelper
  def role_checkboxes(user)
    out = ''
    eval(ENV["ROLES"]).each do |role|
      out += content_tag(:label, :class => 'checkbox') do
        "#{hidden_field_tag('user_roles[' + role + ']', '')}#{check_box_tag('user_roles[' + role + ']', 'yes', user.roles.map(&:name).include?(role))} #{role.titleize}&nbsp;&nbsp;".html_safe
      end
    end
    out.html_safe
  end
end
