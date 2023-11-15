library(text)

# Install text required python packages in a conda environment (with defaults).
textrpp_install()

# Initialize the installed conda environment.
# save_profile = TRUE saves the settings so that you don't have to run textrpp_initialize() after restarting R.
textrpp_initialize(save_profile = TRUE)


# Example text
texts <- c("I feel great!")

# Defaults
embeddings <- textEmbed(texts)
embeddings


# Note that it is also possible to submit an entire dataset to textEmbed() – as well as only retrieving text-level and word-type level embeddings. This is achieved by setting keep_token_embeddings to FALSE, and aggregation_from_tokens_to_word_types to, for example, “mean”. Word type-level embeddings can be used for plotting words in the embedding space.

library(text)

# Transform the text data to BERT word embeddings
wordembeddings <- textEmbed(texts = Language_based_assessment_data_8[1:2],
                            aggregation_from_tokens_to_word_types = "mean",
                            keep_token_embeddings = FALSE)

# See how word embeddings are structured
wordembeddings
