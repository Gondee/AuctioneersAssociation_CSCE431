{"filter":false,"title":"dbio_controller.rb","tooltip":"/app/controllers/dbio_controller.rb","undoManager":{"mark":56,"position":56,"stack":[[{"group":"doc","deltas":[{"start":{"row":2,"column":5},"end":{"row":3,"column":0},"action":"insert","lines":["",""]},{"start":{"row":3,"column":0},"end":{"row":3,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":2},"end":{"row":4,"column":0},"action":"insert","lines":["",""]},{"start":{"row":4,"column":0},"end":{"row":4,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":2},"end":{"row":7,"column":5},"action":"insert","lines":["# Import CSV table","  def import","    Member.import(params[:file])","    redirect_to members_url, notice: \"Products imported.\"","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":5},"end":{"row":3,"column":0},"action":"insert","lines":["",""]},{"start":{"row":3,"column":0},"end":{"row":3,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":2},"end":{"row":10,"column":0},"action":"insert","lines":["",""]},{"start":{"row":10,"column":0},"end":{"row":10,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":2},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":2},"end":{"row":10,"column":3},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":3},"end":{"row":10,"column":4},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":4},"end":{"row":10,"column":5},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":5},"end":{"row":10,"column":6},"action":"insert","lines":["v"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":6},"end":{"row":10,"column":7},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":7},"end":{"row":10,"column":8},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":8},"end":{"row":10,"column":9},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":9},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":2},"end":{"row":12,"column":0},"action":"insert","lines":["",""]},{"start":{"row":12,"column":0},"end":{"row":12,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":12,"column":2},"end":{"row":13,"column":0},"action":"insert","lines":["",""]},{"start":{"row":13,"column":0},"end":{"row":13,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":2},"end":{"row":13,"column":3},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":3},"end":{"row":13,"column":4},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"insert","lines":["d"]},{"start":{"row":13,"column":0},"end":{"row":13,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":0},"end":{"row":13,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"remove","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":3},"end":{"row":13,"column":4},"action":"remove","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":2},"end":{"row":13,"column":3},"action":"remove","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":2},"end":{"row":58,"column":7},"action":"insert","lines":["# Before filters","    ","    def set_member","      @member = current_user","    end","","    # Confirms a logged-in user.","    def logged_in_member","      unless logged_in?","        store_location","        flash[:danger] = \"Please log in.\"","        redirect_to login_url","      end","    end","    # Confirms the correct user.","    def correct_member","      #@member = Member.find(params[:id])","      if current_user?(@member) || current_user_admin?  #in this case admin level is ok as well ","        true #Correct, was creating confusion ","      else","        flash[:notice] = \"Unauthorized. Please Contact Admin\"","        redirect_to members_url","      end","    end","    #Checks if admin is a master admin, in which case they have full control","    def master_admin","      if !current_user_master_admin?","        flash[:notice] = \"Unauthorized. Please Contact Admin\"","        redirect_to login_url","      end","    end","    ","    # Confirms an admin user.","    def admin_member","      if !logged_in?","        flash[:notice] = \"Please log in first.\"","        redirect_to login_url","      else","        if !current_user_admin?","          flash[:notice] = \"Please log in as Admin.\"","          redirect_to login_url","        else ","          true","        end","      end","    end"]}]}],[{"group":"doc","deltas":[{"start":{"row":12,"column":0},"end":{"row":12,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":2},"end":{"row":12,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":9},"end":{"row":11,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":2},"end":{"row":2,"column":0},"action":"insert","lines":["",""]},{"start":{"row":2,"column":0},"end":{"row":2,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":2},"end":{"row":5,"column":67},"action":"insert","lines":["  before_action :set_member,       only: [:show, :edit, :update, :destroy]","  before_action :logged_in_member, only: [:show, :edit, :update]","  before_action :correct_member,   only: [:show]","  before_action :admin_member,     only: [:index]","  before_action :master_admin,     only: [:destroy, :edit, :update]"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":67},"end":{"row":6,"column":0},"action":"insert","lines":["",""]},{"start":{"row":6,"column":0},"end":{"row":6,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":2},"end":{"row":1,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":66},"end":{"row":5,"column":67},"action":"insert","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":67},"end":{"row":5,"column":68},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":68},"end":{"row":5,"column":69},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":69},"end":{"row":5,"column":70},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":70},"end":{"row":5,"column":71},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":71},"end":{"row":5,"column":72},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":72},"end":{"row":5,"column":73},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":73},"end":{"row":5,"column":74},"action":"insert","lines":["x"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":73},"end":{"row":5,"column":74},"action":"remove","lines":["x"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":73},"end":{"row":5,"column":74},"action":"insert","lines":["x"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":0},"end":{"row":3,"column":48},"action":"remove","lines":["  before_action :correct_member,   only: [:show]"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":64},"end":{"row":3,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":43},"end":{"row":2,"column":63},"action":"remove","lines":["show, :edit, :update"]},{"start":{"row":2,"column":43},"end":{"row":2,"column":44},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":44},"end":{"row":2,"column":45},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":45},"end":{"row":2,"column":46},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":46},"end":{"row":2,"column":47},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":47},"end":{"row":2,"column":48},"action":"insert","lines":["x"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":0},"end":{"row":3,"column":49},"action":"remove","lines":["  before_action :admin_member,     only: [:index]"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":49},"end":{"row":3,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":42},"end":{"row":3,"column":74},"action":"remove","lines":[":destroy, :edit, :update, :index"]},{"start":{"row":3,"column":42},"end":{"row":3,"column":43},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":43},"end":{"row":3,"column":44},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":44},"end":{"row":3,"column":45},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":45},"end":{"row":3,"column":46},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":46},"end":{"row":3,"column":47},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":47},"end":{"row":3,"column":48},"action":"insert","lines":["x"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":5,"column":11},"end":{"row":5,"column":11},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1430516796828,"hash":"56cf1fc74058ec26917cf46e2ca29079135d6165"}