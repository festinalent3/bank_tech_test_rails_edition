class Account < ActiveRecord::Base
  has_many :deposits, dependent: :destroy
end
