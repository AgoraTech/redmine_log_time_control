module LogTimeValidation
  module Patches
    module ValidateTime
      unloadable
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          before_destroy :validate_time_delete
          before_update :validate_time_before_update
          before_save :validate_time_before_save
        end
      end

      module ClassMethods
      end

      module InstanceMethods

        def validate_time_delete
          logger.info "validate_time_delete"
          spentOn = self.spent_on
          oldSpentOn = TimeEntry.find(self.id).spent_on
          return (time_is_not_to_old(oldSpentOn) && time_is_not_to_old(spentOn))
        end

        def validate_time_before_update
          logger.info "validate_time_before_update"
          spentOn = self.spent_on
          timeEntry  = TimeEntry.find(self.id)
          oldSpentOn = timeEntry.spent_on
          return (time_is_not_to_old(spentOn) && time_is_not_to_old(oldSpentOn))
        end
        
        def validate_time_before_save
          logger.info "validate_time_before_save"
          spentOn = self.spent_on
          return time_is_not_to_old(spentOn)
        end
        

        def time_is_not_to_old (spent_on)
          logger.info "time_is_not_to_old check spent_on"
          if(spent_on.instance_of?(String))
            spent_on = DateTime.parse(spent_on)
          end
          daysLimit = Setting.plugin_redmine_log_time_control['time_limit']
          dateRequire = Date.today - daysLimit.to_i.days
          if (spent_on < dateRequire)
            errors.add :spent_on, :invalid
            return false
          end
          return true
        end
      end
    end
  end
end

require_dependency 'time_entry'
TimeEntry.send(:include,  LogTimeValidation::Patches::ValidateTime)