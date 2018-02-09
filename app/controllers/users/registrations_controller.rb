class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
  self.resource = resource_class.new_with_session(hash || {}, session)
end
end
