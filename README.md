# README

## Version
* Ruby  2.7.1
* Rails 6.0.3.3

## ER図
```plantuml
skinparam defaultFontName Menlo
skinparam backgroundColor #FFFFFE

entity users {
  id: integer (PK)
  --
  email: string
  encrypted_password: string
  name: string
  profile: text
  remember_created_at: datetime
  reset_password_sent_at: datetime
  reset_password_token: string
}

entity posts {
  id: integer (PK)
  --
  user_id: integer (FK)
  title: string
  body: text
}

entity post_reviews {
  id: integer (PK)
  --
  user_id: integer (FK)
  post_id: integer (FK)
  body: text
}

entity post_review_likes {
  id: integer (PK)
  --
  user_id: integer (FK)
  post_review_id: integer (FK)
}

users --o{ post_reviews
users --o{ posts
users --o{ post_review_likes

posts -r-o{ post_reviews
post_reviews -r-o{ post_review_likes

```