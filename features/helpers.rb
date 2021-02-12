module Helpers
  def add_screenshot
    screenshot_file = page.save_screenshot("log/screenshot.png")
    screenshot_b64 = Base64.encode64(File.open(screenshot_file, "rb").read)
    attach(screenshot_b64, "image/png")
  end

  def add_browser_logs
    time_now = Time.now
    current_url = Capybara.current_url.to_s
    logs = page.driver.browser.manage.logs.get(:browser).map { |line| [line.level, line.message] }
    logs.reject! { |line| ["WARNING", "INFO"].include?(line.first) }
    attach(time_now.strftime("%Y-%m-%d-%H-%M-%S" + "\n") + ("Current URL: " + current_url + "\n") + logs.join("\n"), "text/plain")
  end
end
