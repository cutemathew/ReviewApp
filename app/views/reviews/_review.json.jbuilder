json.extract! review, :id, :rating, :comments, :reference, :created_at, :updated_at
json.url review_url(review, format: :json)