class TimeControlHooks < Redmine::Hook::ViewListener

  def controller_timelog_edit_before_save(context = {})
    spentOn = context[:time_entry].spent_on
    dateRequire = Date.today - LogTimeControl.last.howManyDay.days
    if (spentOn < dateRequire)
       # raise "Time is inncorrect"
    end
  end  
end
