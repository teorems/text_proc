# naive model (mean sentiment per sentence as predictor)

library(tidyverse)
library(tidytext)
library(yardstick)

rr <- read_tsv("Restaurant_Reviews.tsv", col_types = "cf")

rr |>
  mutate(n_rev = row_number()) |>
  unnest_tokens(word, Review) |>
  anti_join(stop_words) |>
  count(word) |>
  arrange(desc(n))


rr_preds <- rr |>
  mutate(n_rev = row_number()) |>
  unnest_tokens(word, Review) |>
  left_join(get_sentiments("bing")) |>
  mutate(sentiment =if_else(sentiment == "positive", 1, -1, 0)) |>
  group_by(n_rev) |>
  summarise(mean_s = mean(sentiment), pred = if_else(mean(sentiment) >=0, 1, 0))

rr_preds

rr_preds |>
  bind_cols(truth = rr$Liked) |>
  mutate(pred = factor(pred, levels = c(1,0))) |>
  conf_mat(estimate = pred,
           truth = truth) |>
  summary()


