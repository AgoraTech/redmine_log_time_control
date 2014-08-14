Redmine Log Time Control
========================

== How it work?
Plugin adds calbacks to time_entry and checks that spend_on is not too old to update/delete , too old mean that the date(spend_on) has not to be less than currentTime - dayLimit form settings.

== Installation and Setup

1. In your redmine plugins directory,
  (bitnami redmine-2.5.2-0/apps/redmine/htdocs/plugins)
  run the command: `git clone https://github.com/AgoraTech/redmine_log_time_control.git`
2. Restart web server


License
---------

BaseController is released on the BSD 2-clause license. The product is not suitable for consumer use.

You can get the license in "license.md" file available in this repository.
