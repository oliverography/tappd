class Beer < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
end