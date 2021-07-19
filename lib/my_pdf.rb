class MyPdf
  def initialize(course_id)
    @course = Course.find(course_id)
  end

  def create_pdf
    create_template
    
    pdf = WickedPdf.new.pdf_from_string(@template_pdf, encoding: 'UTF-8')

    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
  end

  # private

  def pdf_path
    Rails.root.join('pdfs',"#{@course.name}_program.pdf")
  end

  def create_template
    @template = Liquid::Template.parse(@course.template.body)
    @template_pdf = @template.render(
      {
        'course' => {'name'  => @course.name, 'level'  => @course.level, 'volume'  => @course.volume},
        'user' => {'name'  => @course.user.name}
      } 
    ) 
  end
end
