# frozen_string_literal: true

class Openai
  MAX_CHARS = 5000

  def initialize(custom_prompt_prefix = '')
    api_key = Rails.application.credentials.openai.apikey
    @client = OpenAI::Client.new(access_token: api_key)
    @model = 'gpt-3.5-turbo'
    @custom_prompt_prefix = custom_prompt_prefix
  end

  def ask(text)
    prepare_message(text)
    perform_api_call
  rescue StandardError => e
    "An error occurred: #{e.message}"
  end

  private

  def prepare_message(text)
    truncated_question = truncate_question(text.to_s)
    @prepared_message = [{ role: 'user', content: @custom_prompt_prefix + truncated_question }]
  end

  def perform_api_call
    response = @client.chat(
      parameters: {
        model: @model,
        messages: @prepared_message,
        temperature: 0.7
      }
    )
    response['choices'].first['message']['content']
  end

  def truncate_question(question)
    max_question_length = MAX_CHARS - @custom_prompt_prefix.length
    question.length > max_question_length ? question[0...max_question_length] : question
  end
end
