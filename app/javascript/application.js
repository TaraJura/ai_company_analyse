// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import 'bootstrap';

document.addEventListener("turbo:load", function() {
  // Attempt to get a reference to the form element
  const form = document.getElementById('company-analysis-form');

  // Check if the form element exists before adding an event listener
  if (form) {
    const loader = document.getElementById('loader');
    const analyzedDataContainer = document.getElementById('analyzed-data');

    form.addEventListener('submit', function(e) {
      e.preventDefault(); // Prevent the form from submitting the traditional way

      const icoValue = document.querySelector('#company-analysis-form input[name="ico"]').value;
      const formData = new FormData();
      formData.append('ico', icoValue);

      // Check if loader and analyzedDataContainer elements exist before attempting to use them
      if (loader && analyzedDataContainer) {
        // Show loader
        loader.classList.remove('d-none');
        analyzedDataContainer.textContent = ''; // Optionally clear previous data

        fetch('/company/analyze_company', {
          method: 'POST',
          body: formData,
          headers: {
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          }
        }).then(response => response.text())
          .then(data => {
            // Hide loader
            loader.classList.add('d-none');
            // Display data
            analyzedDataContainer.textContent = data;
          }).catch(error => {
            console.error('Error:', error);
            // Hide loader
            loader.classList.add('d-none');
            // Optionally display an error message
            analyzedDataContainer.textContent = 'Failed to load data.';
          });
      } else {
        console.error('Required elements (loader or analyzedDataContainer) not found.');
      }
    });
  } else {
    console.error('Form element not found.');
  }
});
