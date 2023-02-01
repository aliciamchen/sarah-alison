library(here)
library(tidyverse)
library(digest)

d <- read_csv(here('data/exp2/non_anonymized/exp2_data.csv'))
d.dem <- read_csv(here('data/exp2/non_anonymized/exp2_demographics.csv'))

# Anonymize participants
d$subject_id <- sapply(d$subject_id, digest)
d.dem$subject_id <- sapply(d.dem$subject_id, digest)

d %>%
  write_csv(here('data/exp2_data.csv'))

d.dem %>%
  write_csv(here('data/exp2_demographics.csv'))