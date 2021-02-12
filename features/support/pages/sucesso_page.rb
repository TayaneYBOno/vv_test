class SuccessPage < SitePrism::Page
  element :title_page, ".page-header .entry-title"
  element :entry_content_page, ".entry-content"
  element :response_msg_area, ".nf-response-msg"

  def load_page_info
    page_data = YAML.load_file(File.join(Dir.pwd, 'features\support\fixtures\pesquisa_qa\success_content.yaml'))
    page_data
  end

  def wait_page_load
    within_element(response_msg_area)
  end

  def entry_content_text
    entry_content_page.all("p")[0].text
  end
end
