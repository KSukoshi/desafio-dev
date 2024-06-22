class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @total_transactions = PaymentTransaction.total_transactions
        @total_methods = PaymentMethod.total_methods
        @total_users = User.total_users
        @total_value = PaymentTransaction.total_value.to_f
    end
end
