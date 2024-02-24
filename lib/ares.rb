class Ares
  def initialize
    @url = 'https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty/vyhledat'
  end

  def get_company_details(ico)
    request = Typhoeus::Request.new(
      @url,
      method: :post,
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        "ico": [ico]
      }.to_json
    ).run

    if request.success?
      parsed_req = JSON.parse(request.response_body)

      if parsed_req['pocetCelkem'].zero?
        false
      else
        parsed_req
      end
    else
      false
    end
  end

  def ai_analysed_data(ico)
    ares_data = get_company_details(ico)
    return unless ares_data

    custom_command = 'Udělej mi analýzu dat z obchodního rejstříku, odpovídej jako profesionální datový analytik, odpověz v češtině.'
    openai_class = Openai.new(custom_command)
    ai_response = openai_class.ask(ares_data)
    ai_response
  end
end
