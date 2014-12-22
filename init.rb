require_dependency 'log_time_validation/patches/validate_time'
require_dependency 'log_time_validation/patches/time_entry_patch'

Redmine::Plugin.register :redmine_log_time_control do
  name 'Redmine Log Time Control plugin'
  author 'agora'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  settings(:default => {
               'hours_limit_per_day' => '20',
               'time_limit' => '21'
             }, :partial => 'settings/days_to_do_settings')
end
