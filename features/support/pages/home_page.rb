class HomePage < SitePrism::Page
  element :home_menu, "#menu-item-147"
  element :blog_menu, "#menu-item-139"
  element :about_menu, "#menu-item-140"
  element :contact_menu, "#menu-item-141"
  element :register_menu, "#menu-item-84"
  element :search_menu, "#menu-item-226"

  def load
    visit "/"
  end

  def select_menu(menu)
    # find("#site-navigation .menu-principal-container #primary-menu li a", text: menu).click
    # find("#site-navigation .menu-principal-container #primary-menu").all("li a", text: menu).click
    case menu.upcase
    when "HOME"
      home_menu.click
    when "BLOG"
      blog_menu.click
    when "SOBRE"
      about_menu.click
    when "CONTATO"
      contact_menu.click
    when "CADASTRO"
      register_menu.click
    when "PESQUISA - QA"
      search_menu.click
    end
  end
end
