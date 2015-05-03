class SingleTenantChequeReport
	require "prawn"

	def self.create(tenant)
		tenant = tenant.first
		pdf = Prawn::Document.new
			#pdf.stroke_axis
			pdf.move_down 25
			pdf.font_size(15) { pdf.text "#{tenant.tenantname}'s Postdated Cheques", :align => :center }
			pdf.move_down 25
			pdf.font_size(12) { pdf.text "Civic Address #{tenant.tenantbuildinginfo} ", :align => :center }
			pdf.font_size(12) { pdf.text "Local #{tenant.propertynumber} ", :align => :center }
			
			pdf.move_down 25
			pdf.font_size(12) { pdf.text "Monthly Rent: #{tenant.monthrent2} ", :align => :center }
			cheques = tenant.cheques
			data = [["Post Date", "Amount"]]
			sorted_collection = cheques.sort { |a,b| a.postdate <=> b.postdate }
			sorted_collection.each do |c|
				a = ActionController::Base.helpers.number_with_precision(c.amount, precision: 2)
				d = Date::MONTHNAMES[c.postdate.month] + " " + c.postdate.year.to_s
				data += [["#{d}","#{a}"]]
			end

			
			pdf.table(data, :header => true, :position => :center)
			filename = File.join(Rails.root, "tmp/", "single_tenant_cheque_report.pdf")
			pdf.render_file filename
			filename
	end

end
