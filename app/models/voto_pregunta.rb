class VotoPregunta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :pregunta
end
