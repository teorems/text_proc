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

# The textEmbed() function automatically transforms character variables in a given tibble to word embeddings.
#
# > A word embedding comprises values that represent the latent meaning of a word.The numbers may be seen as coordinates in a space that comprises several hundred dimensions. The more similar two words’ embeddings are, the closer positioned they are in this embedding space, and thus, the more similar the words are in meaning. Hence, embeddings reflect the relationships among words, where proximity in the embedding space represents similarity in latent meaning.
#
# #textTrain(): Examine the relationship between text and numeric variables
#
# The textTrain() is used to examine how well the word embeddings from a text can predict a numeric variable. This is done by training the word embeddings using ridge regression and 10-fold cross-validation. In the example below we examine how well the harmony text responses can predict the rating scale scores from the Harmony in life scale.
