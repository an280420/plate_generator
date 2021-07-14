class PrintWorker
  require 'liquid'
  require 'wicked_pdf'

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(course_id)
    program = MyPdf.new(course_id)
    program.create_pdf
  end
end
