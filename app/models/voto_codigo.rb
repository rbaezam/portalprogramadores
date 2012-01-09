class VotoCodigo < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :codigo
end
