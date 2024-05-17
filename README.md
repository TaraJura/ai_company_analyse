# TechTools

TechTools is a testing application built with Ruby on Rails 7. This project is designed to assist developers in testing various functionalities and features within a Rails environment.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Installation

To get started with TechTools, follow these steps:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/techtools.git
    cd techtools
    ```

2. **Install dependencies**:

    ```bash
    bundle install
    ```

3. **Set up the database**:

    Make sure you have PostgreSQL installed and running. Then create and migrate the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Install JavaScript dependencies**:

    ```bash
    yarn install
    ```

5. **Run the server**:

    ```bash
    rails server
    ```

Visit `http://localhost:3000` in your browser to see the application running.

## Usage

TechTools is designed to help developers test and verify different features in a Rails application. You can use it as a reference or as a base to build and test your own Rails features.

### Features

- User authentication with Devise
- Bootstrap for styling
- Sample models and controllers
- Example forms and views

## Testing

TechTools includes a test suite to ensure the application works correctly. To run the tests, use the following command:

```bash
rails test
