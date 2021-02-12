class PesquisaQaPage < SitePrism::Page
  element :name_field, "input[name='fname']" # "#nf-field-5"
  element :last_name_field, "input[name='lname']" # "#nf-field-6"
  element :email_field, "input[name='email']" # "#nf-field-7"
  element :confirm_email_field, "#nf-field-8"
  element :age_radio_18_30, "#nf-field-10-wrap .nf-field-element ul li #nf-label-class-field-10-0"
  element :age_radio_31_49, "#nf-field-10-wrap .nf-field-element ul li #nf-label-class-field-10-1"
  element :age_radio_49_plus, "#nf-field-10-wrap .nf-field-element ul li #nf-label-class-field-10-2"
  element :qa_experience_combobox, "#nf-field-11"
  element :qa_interest_combobox, "#nf-field-12"
  element :improve_radio_technical, "#nf-field-13-wrap .nf-field-element ul li #nf-label-class-field-13-0"
  element :improve_radio_business, "#nf-field-13-wrap .nf-field-element ul li #nf-label-class-field-13-1"
  element :improve_radio_communication, "#nf-field-13-wrap .nf-field-element ul li #nf-label-class-field-13-2"
  element :improve_radio_lead, "#nf-field-13-wrap .nf-field-element ul li #nf-label-class-field-13-3"
  element :improve_radio_all, "#nf-field-13-wrap .nf-field-element ul li #nf-label-class-field-13-4"
  element :programming_language_field, "#nf-field-14"
  element :career_plan_field, "#nf-field-15"
  element :send_button, "#nf-field-16"

  def load
    visit "/?page_id=2"
  end

  def faker_data
    faker_qa_data = Hash.new
    faker_qa_data[:name] = Faker::Name.first_name
    faker_qa_data[:last_name] = Faker::Name.last_name
    faker_qa_data[:email] = "#{faker_qa_data[:name]}.#{faker_qa_data[:last_name]}@email.com"
    faker_qa_data[:confirm_email] = faker_qa_data[:email]
    faker_qa_data[:phone] = nil
    faker_qa_data[:age] = Faker::Number.between(from: 18, to: 51)
    faker_qa_data[:programming_language] = Faker::ProgrammingLanguage.name
    faker_qa_data[:career_plan] = nil
    faker_qa_data
  end

  def set_name(name)
    name_field.set(name)
  end

  def set_last_name(last_name)
    last_name_field.set(last_name)
  end

  def set_email(email)
    email_field.set(email)
  end

  def set_confirm_email(confirm_email)
    confirm_email_field.set(confirm_email)
  end

  def set_age(age)
    case age
    when 18..30
      age_radio_18_30.click
    when 31..49
      age_radio_31_49.click
    when 50..inf
      age_radio_49_plus.click
    else
      puts "Idade inválida"
    end
  end

  def select_sample_qa_experience
    qa_experience_combobox.all("option").sample.select_option
  end

  def select_sample_qa_interest
    qa_interest_combobox.all("option").sample.select_option
  end

  def select_sample_improvement
    improve_options = ["technical", "business", "communication", "lead", "all"]
    improve_area = improve_options.sample
    case improve_area
    when "technical"
      improve_radio_technical.click
    when "business"
      improve_radio_business.click
    when "communication"
      improve_radio_communication.click
    when "lead"
      improve_radio_lead.click
    when "all"
      improve_radio_all.click
    else
      "Invalid option for improvement area."
    end
  end

  def set_programming_language(language)
    programming_language_field.set(language)
  end

  def click_send_button
    send_button.click
  end

  def fill_form_mandatory(data)
    self.set_name(data[:name]) unless data[:name].nil? || data[:name].empty?
    self.set_last_name(data[:last_name]) unless data[:last_name].nil? || data[:last_name].empty?
    self.set_email(data[:email]) unless data[:email].nil? || data[:email].empty?
    self.set_confirm_email(data[:confirm_email]) unless data[:confirm_email].nil? || data[:confirm_email].empty?
    self.set_age(data[:age])
    self.select_sample_qa_experience
    self.select_sample_improvement
    self.set_programming_language(data[:programming_language])
  end
end
