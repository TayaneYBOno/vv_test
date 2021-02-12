Before do
  include Capybara::DSL
  @home_page = HomePage.new
  @pesquisa_qa_page = PesquisaQaPage.new
  @success_page = SuccessPage.new
end

After do
  add_screenshot
  add_browser_logs unless ENV["BROWSER"] != "chrome"
end

at_exit do
  time = Time.now
  ReportBuilder.configure do |config|
    config.json_path = "log/report.json"
    config.report_path = "log/cucumber_web_report"
    config.report_types = [:retry, :html]
    config.color = "green"
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "VV Report Web Automation Test Results"
    config.compress_images = false
    config.additional_info = { "Project name" => "Via Varejo", "Browser" => "#{ENV["BROWSER"]}", "Environment" => "#{ENV["ENV_TYPE"]}", "Report generated" => time }
  end
  ReportBuilder.build_report
end
