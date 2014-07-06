Rails.configuration.stripe = {
  :publishable_key => 'pk_test_4KVD1TVf9Uhlsoggm6uQv39h',
  :secret_key      => 'sk_test_4KVDfL3hcrE1sKaxDoHYlkcz'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
