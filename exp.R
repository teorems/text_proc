rr <- read_tsv("Restaurant_Reviews.tsv", col_types = "cf")

rr |>
  mutate(n_rev = row_number()) |>
  unnest_tokens(word, Review) |>
  anti_join(stop_words) |>
  count(word) |>
  arrange(desc(n))


rr_s <- rr |>
  mutate(n_rev = row_number()) |>
  unnest_tokens(word, Review) |>
  left_join(get_sentiments("bing")) |>
  mutate(sentiment = as.factor(if_else(sentiment == "positive", 1, -1, 0)))

##A SUIVRE ...



