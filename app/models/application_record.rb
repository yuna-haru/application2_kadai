class ApplicationRecord < ActiveRecord::Base
   #before_action :configure_permitted_parameters, if: :devise_controller?
  self.abstract_class = true


end
