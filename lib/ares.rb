# frozen_string_literal: true

class Ares
  def self.or_data(ico)
    url = "https://wwwinfo.mfcr.cz/cgi-bin/ares/darv_or.cgi?ico=#{ico}&xml=0&ver=1.0.2&stdadr=true&rozsah=1"
    ares_data = self.data(url, ico)
    ares_data['Ares_odpovedi']['Odpoved']['Vypis_OR'] if ares_data
  end

  def self.data(url, ico)
    file_uploaded = false
    request_tried = 0
    until file_uploaded == true || request_tried == 10
      request = Typhoeus::Request.new(
        url,
        method: :get,
        ssl_verifypeer: false,
        headers: { 'User-Agent' => 'curl/7.68.0' }
      ).run
      file_uploaded = true if request.code == 200
      request_tried += 1
      sleep 1
    end
    return if request_tried == 10

    xml = request.response_body.force_encoding('UTF-8')
    ares_full_hash_data = Hash.from_xml(xml)
  end

  def self.ai_analysed_data(ico)
    ares_data = self.or_data(ico)
    return unless ares_data
    
    custom_command = 'Udělej mi analýzu dat z obchodního rejstříku, odpovídej jako profesionální datový analytik, odpověz v češtině.'
    openai_class = Openai.new(custom_command)
    ai_response = openai_class.ask(ares_data)
    ai_response
  end
end
