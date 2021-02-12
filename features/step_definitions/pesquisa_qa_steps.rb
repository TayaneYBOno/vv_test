Dado("acesse o menu {string}") do |menu|
  @home_page.select_menu(menu)
end

Quando("eu preencher todos os campos obrigatórios") do
  @qa_form_answers = @pesquisa_qa_page.faker_data
  @pesquisa_qa_page.fill_form_mandatory(@qa_form_answers)
  @pesquisa_qa_page.click_send_button
end

Então("deve ser direcionado para uma página de sucesso") do
  @success_page.wait_page_load
  @page_info = @success_page.load_page_info
  expect((@success_page.title_page).text).to eql @page_info["title"]
  expect(@success_page.entry_content_text).to eql @page_info["entry_content"]
  expect((@success_page.response_msg_area).text).to eql @page_info["response_msg"]
end