Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_51NnLiPHlA94w3Pl99DBWL3Iy2m8WvkICY2np5dIUenjt1mifEdAAV6x4ttlxsbmv3HeNdL36bqYaz92KbAdE1iB900wBveGick'],
  :secret_key      => ENV['sk_test_51NnLiPHlA94w3Pl9HJebHNMZkbdFbegGHdWZTltsZai0Yv0kCvgnPR25k6EryOvDqW9Vo39whR9GxbAQ8rGqNZVy00oHHITn7N']
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]

