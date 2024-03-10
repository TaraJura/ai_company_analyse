  class VerificationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      puts 'index'
    end

    def receive_verification
      # Decode the Base64 image
      if params[:image_data]
        # Remove the header of the Base64 string ('data:image/png;base64,')
        encoded_image = params[:image_data].split(',')[1]
        decoded_image = Base64.decode64(encoded_image)

        # Create a Tempfile to save the decoded image
        image_tempfile = Tempfile.new(["upload", ".png"])
        image_tempfile.binmode
        image_tempfile.write(decoded_image)
        image_tempfile.rewind

        # Assuming you have a model called `Verification` with an image attachment
        @verification = Verification.new
        @verification.image.attach(io: image_tempfile, filename: "verification.png")

        if @verification.save
          # Handle successful save, maybe redirect or respond with success
          flash[:success] = "Image uploaded successfully."
          redirect_to verification_index_path # Change this to where you want to redirect
        else
          # Handle save failure
          flash[:error] = "There was a problem saving the image."
          render :index
        end

        # Ensure the tempfile is closed and unlinked (deleted)
        image_tempfile.close
        image_tempfile.unlink
      else
        flash[:error] = "No image data received."
        render :index
      end
    end
  end
