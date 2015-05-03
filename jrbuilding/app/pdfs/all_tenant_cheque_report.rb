class AllTenantChequeReport
	require "prawn"

	def self.create(tenant)
		tenant = tenant.first
		pdf = Prawn::Document.new(:page_size => "EXECUTIVE", :page_layout => :portrait)
			#pdf.stroke_axis

			pdf.move_down 25
			b_all = Building.all
			b_all.each do |b|
				pdf.move_down 10
				pdf.font_size(20) { pdf.text "#{b.half_address} ", :align => :center }
				p_all = Property.search(b.half_address)
				p_all.each do |p|
					pdf.move_down 10
					pdf.font_size(15) { pdf.text "Local #{p.number} ", :align => :center }
					t_all = Tenant.search(p.number.to_s+ " - " + b.half_address )
					
						t_all.each do |t|
							pdf.font_size(12) { pdf.text "#{t.tenantname}", :align => :center }
							
							pdf.font_size(12) { pdf.text "Monthly Rent: #{t.monthrent2} ", :align => :center }
							cheques = t.cheques
							if (cheques.count > 0)
								data = [["Post Date", "Amount"]]
								sorted_collection = cheques.sort { |a,b| a.postdate <=> b.postdate }
								sorted_collection.each do |c|
									a = ActionController::Base.helpers.number_with_precision(c.amount, precision: 2)
									d = Date::MONTHNAMES[c.postdate.month] + " " + c.postdate.year.to_s
									data += [["#{d}","#{a}"]]
								end
								pdf.move_down 10
								pdf.table(data, :header => true, :position => :center)
								pdf.move_down 25
							else 
								pdf.move_down 10
								pdf.font_size(12) { pdf.text "No Cheques Recieved", :align => :center }
								pdf.move_down 25
							end
							
						end
					
				end
			end
			
			
			
			filename = File.join(Rails.root, "tmp/", "all_tenant_cheque_report.pdf")
			pdf.render_file filename
			filename
	end

end