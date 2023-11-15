# To calculate cosine similarity from text embeddings in R, you can use the `cosine()` function from the `lsa` package. Here is an example code snippet that shows how to calculate cosine similarity between two texts:

  ```
library(lsa)
library(proxy)
library(tm)

text = c("This is the first sentence.", "This is the second sentence.")
corpus <- VCorpus(VectorSource(text))
tdm <- TermDocumentMatrix(corpus, control = list(wordLengths = c(1, Inf)))
tdm_mat <- as.matrix(tdm)
lsaSpace <- lsa(tdm_mat)
lsaMatrix <- diag(lsaSpace$sk) %*% t(lsaSpace$dk)
distMatrix <- 1 - cosine(lsaMatrix)

# In this example, `text` is a character vector containing two sentences. The `TermDocumentMatrix()` function is used to create a term-document matrix from the text data. The `lsa()` function is then used to perform latent semantic analysis on the term-document matrix. Finally, the `cosine()` function is used to calculate the cosine similarity between the resulting document vectors.
#
# I hope this helps!

#   Source : conversation avec Bing, 15/11/2023
# (1) text - R: Correct Way to Calculate Cosine Similarity? - Stack Overflow. https://stackoverflow.com/questions/72037888/r-correct-way-to-calculate-cosine-similarity.
# (2) How to calculate cosine similarity on a list of embeddings. https://stackoverflow.com/questions/76623186/how-to-calculate-cosine-similarity-on-a-list-of-embeddings.
# (3) Text Mining Analysis: some theory and practice in R. https://www.r-bloggers.com/2015/10/text-mining-analysis-some-theory-and-practice-in-r/.
# (4) r - How can I calculate Cosine similarity between two strings vectors .... https://stackoverflow.com/questions/34045738/how-can-i-calculate-cosine-similarity-between-two-strings-vectors.
# (5) Cosine similarity between sentence embeddings is always positive. https://datascience.stackexchange.com/questions/101862/cosine-similarity-between-sentence-embeddings-is-always-positive.
