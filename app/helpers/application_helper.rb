module ApplicationHelper
	def get_unprocessed_status_code
		Status.find_by_name('unprocessed').id
	end
	
	def get_processing_status_code
		Status.find_by_name('processing').id
	end

	def get_finished_status_code
		Status.find_by_name('finished').id
	end
end
