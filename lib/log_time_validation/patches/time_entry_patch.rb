module RedmineTimesheetPlugin
  module Patches
    module TimeEntryPatch
      def self.included(base)
        base.extend(ClassMethods)

        base.send(:include, InstanceMethods)
        base.class_eval do
          validate :validate_time_limit
        end
      end

      module ClassMethods
      end

      module InstanceMethods

        def validate_time_limit
          if hours # another validation catches empty hours
            limit = Setting.plugin_redmine_log_time_control['hours_limit_per_day'].to_f || 20
            reported = TimeEntry.where(user_id: self.user_id, spent_on: self.spent_on).sum(:hours)
            if reported && reported > 0 && reported + hours > limit
              errors.add :hours, l(:befor_reported_hours_plus_current_hours_is_too_much, limit: limit, reported: reported)
            elsif hours > limit
              errors.add :hours, l(:hours_to_much_per_day, limit: limit)
            end
          end
        end
      end
    end
  end
end

require_dependency 'time_entry'
TimeEntry.send(:include, RedmineTimesheetPlugin::Patches::TimeEntryPatch)
