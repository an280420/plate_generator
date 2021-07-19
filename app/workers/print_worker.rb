class PrintWorker
  require 'liquid'
  require 'wicked_pdf'

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(course_id)
    program = PdfGenerator.new(course_id)
    program.create_pdf
  end
end
