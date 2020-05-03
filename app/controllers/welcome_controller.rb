class WelcomeController < ApplicationController
  def index
    @bulletins = Article.order(pinned: :desc, id: :desc).includes(:user)
    unless user_signed_in?
      @bulletins = @bulletins.where(public: true)
    end
    @bulletins = @bulletins.limit(5)
    unless user_signed_in? and current_user.admin?
      @contests = Contest.where("visible_state = 0 or (visible_state = 1 and (now() between start_time and end_time or (timediff(start_time, now()) <= \'00:10:00\' and timediff(start_time, now()) >= \'00:00:00\')))").order("id DESC").limit(3)
    else
      @contests = Contest.order("id DESC").limit(3)
    end
    @users = get_sorted_user.take(10)
  end

  def edit_announcement
    authenticate_admin!
  end

  def alter_announcement
    authenticate_admin!
    anno = {:name => params[:name].to_s, :message => params[:message].to_s}
    File.open("public/announcement/anno", "w") do |f|
      f.write(anno.to_json)
    end
    redirect_to root_path
  end
end
