module ApplicationHelper
	def blad(objekt)
		render(:partial=>'dodatki/bledy', :locals=>{:objekt=>objekt})
	end
end
