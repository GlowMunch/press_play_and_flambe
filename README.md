# Culinary API

Welcome! This API provides various endpoints to retrieve recipes and learning resources. Users will have registration, login, and favorites related to different recipes.

## Learning Goals

- Build a JSON API using Ruby on Rails.
- Implement CRUD operations for various resources.
- Authenticate users and handle user sessions securely.
- Integrate with external APIs to fetch recipe and learning resource data.
- Practice error handling and validation.
- Utilize JSON serialization to structure API responses.

## Endpoints

### 1. Get Recipes For A Particular Country

**Endpoint:** `GET /api/v1/recipes`

### 2. Get Learning Resources for a Particular Country

**Endpoint:** `GET /api/v1/learning_resources`

### 3. User Registration

**Endpoint:** `POST /api/v1/users`

### 4. Log In User

**Endpoint:** `POST /api/v1/sessions`

### 5. Add Favorites

**Endpoint:** `POST /api/v1/favorites`

### 6. Get a User’s Favorites

**Endpoint:** `GET /api/v1/favorites`

## Getting Started

1. Clone this repository.

2. Run `bundle install`.

3. Run `rails db:create` and `rails db:migrate`.

4. Run `bundle exec rspec` for test suite

5. Obtain API keys from the required external services (Edamam Recipe API, YouTube API, Image API).

6. Use Figaro to secure your Api keys. Follow the docs here [Figaro Gem](https://github.com/laserlemon/figaro)
