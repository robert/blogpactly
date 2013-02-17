desc "run delayed jobs; to be used with the Heroku scheduler on staging server every 10 minutes to avoid paying a worker dyno"
task run_dj: :environment do
  puts "Start running DJ jobs, note that it does not deal well with failed jobs"
  Rails.logger.info "Start running DJ jobs, note that it probably does not deal well with failed jobs"
  Delayed::Job.all.each do |job|
    job.invoke_job
    job.destroy
  end
  puts "Finished running DJ jobs"
  Rails.logger.info "Finished running DJ jobs"
end
