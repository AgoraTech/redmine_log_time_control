class RedmineLogTimeControlController < ApplicationController
  unloadable
  def index
    @logTimeControls = LogTimeControl.all
  end

  def save
    @dayslimit =  params[:dayslimit]
    logTimeControl = LogTimeControl.new(:howManyDay => @dayslimit)
    if logTimeControl.save
      flash[:notice] = 'time saved.'
      logger.info "save"
    end
    #redirect_to :action => 'index'
  end

end
