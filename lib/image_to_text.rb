class ImageToText
  def self.extract_text(verification)
    verification = Verification.find(verification) if verification.is_a?(Integer)

    if verification.image.attached?
      Tempfile.create(["verification_image", ".png"]) do |temp_image|
        temp_image.binmode
        temp_image.write(verification.image.download)
        temp_image.rewind

        return RTesseract.new(temp_image.path).to_s
      end
    else
      "No image found for the given verification."
    end
  rescue ActiveRecord::RecordNotFound
    "Verification not found."
  rescue StandardError => e
    "An error occurred during text extraction: #{e.message}"
  end
end
