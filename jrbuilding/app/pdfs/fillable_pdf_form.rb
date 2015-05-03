class FillablePdfForm

  attr_writer :template_path
  attr_reader :attributes

  def initialize
    fill_out
  end

  def export(output_file_path=nil, tenantname, current_user)
    output_path = output_file_path || "tmp/#{tenantname}_lease_#{Time.now}.pdf" # make sure tmp/pdfs exists
    pdftk.fill_form template_path(current_user), output_path, attributes
    output_path
  end

  def get_field_names 
    pdftk.get_field_names template_path
  end

  def template_path(current_user)
    file = open(User.mlease_url(current_user))
    @template_path ||= file.path # makes assumption about template file path unless otherwise specified
  end

  protected

  def attributes
    @attributes ||= {}
  end

  def fill(key, value)
    attributes[key.to_s] = value
  end

  def pdftk
   
    @pdftk ||= PdfForms.new(ENV['PDFTK_PATH'] || '') # On my Mac, the location of pdftk was different than on my linux server.
  end

  def fill_out
    raise 'Must be overridden by child class'
  end

end