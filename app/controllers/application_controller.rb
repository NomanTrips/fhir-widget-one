class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
    def get_resource(resource_type, id)
		res =  ActiveRecord::Base.connection.execute("SELECT fhir.read('#{resource_type}', '#{id}');") # Running fhirbase stored procedure
		puts 'res status: ' + res.cmd_status()
		puts 'tuple amt: ' + res.ntuples().to_s
		
		if res.ntuples() > 0 then
			begin
				res_hash = res[0] #First row of query result
				record_hash = res_hash.first #Some kind of wrapper array?
				result = record_hash.second #string of the json content
			end
	
	return result
  end
  
end
