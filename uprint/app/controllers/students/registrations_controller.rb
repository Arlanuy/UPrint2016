class Students::RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters

    def create
        super
        @student.errors.messages.each do |e|
            p e
        end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:name,
                                                    :student_number,
                                                    :email,
                                                    :contact_number,
                                                    :password,
                                                    :password_confirmation)
    end
end
