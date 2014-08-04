require_dependency 'time_control_hooks'
require_dependency 'log_time_validation/patches/validate_time'

Redmine::Plugin.register :redmine_log_time_control do
  name 'Redmine Log Time Control plugin'
  author 'agora'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  settings :default => {'empty' => true}, :partial => 'settings/days_to_do_settings'
end
