# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'redmineLogTimeControl', :to => 'redmineLogTimeControl#index'
post 'redmineLogTimeControl', :to => 'redmineLogTimeControl#save'
get 'redmine_log_time_control', :to => 'redmineLogTimeControl#index'

