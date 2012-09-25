module LocaleHelper
  
	def format_datetime(datetime)
	  
		datetime.strftime("%d/%m/%Y %H:%m") unless datetime==nil
	end
  
end