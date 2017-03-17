class LedgerController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:name]
      @accounts = Account.name_search(params[:name]).paginate(:page => params[:page], :per_page => 20  )
    else
      @accounts = Account.paginate(:page => params[:page], :per_page => 20).roots
    end
    respond_to do |format|
        format.html
        format.pdf do
          render pdf: "file_name"   # Excluding ".pdf" extension.
        end
      end
  end
end
