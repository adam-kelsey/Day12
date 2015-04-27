class Search < ActiveRecord::Base
  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ["name LIKE ? OR practice LIKE ? OR hospital_name LIKE ? OR medication_name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR description LIKE ? OR dob LIKE ? OR gender LIKE ? OR bloodtype LIKE ? AND hospital_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "params[:hospital_id"])
  #   else
  #     find(:all)
  #   end
  # end
end