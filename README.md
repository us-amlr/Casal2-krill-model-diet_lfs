# Casal2-krill-model-diet_lfs
Krill length-frequencies from penguin diets years 1977-2020 are added to the model configurations described in 'Casal-krill-model-mcmc'

This repository contains the same Casal2 model configurations as found in 'https://github.com/us-amlr/Casal2-krill-model-mcmc', but with three additional data sets for the annual length-frequencies of krill from 1977-2020. These were obtained from diet-sampling of penguin predators of krill in the U.S. AMLR sampling strata - Adélie (ADPE), chinstrap (CHPE), and gentoo (GEPE) penguins. The penguin diet data are in 'calculate_lfs_from_diet_data/data' and the calculations of length-frequencies are in 'calculate_lfs_from_diet_data/R_krill_lfs_pengDiets.r'

For the other length-frequency data sets in these model configurations from the U.S. AMLR trawl surveys and the fishery observer data, the number of tows sampled each year provided a measure of annual sample size. Without such a corresponding measure for sample size for the penguin diet data, constant sample weightings of 30 were assigned for each length-bin, year sampled and penguin species.

The rhat diagnostic (see 'Figures' for each configuration) indicated the parameters in the 'separate non-simplex-660K-catch' configuration were more estimable (only one parameter with rhat > 1.1)  than in the 'combined non-simples-600K_catch' configuration (2 parameters > 1.1). The AIC score of the separate model (2555.48) was also better than for the combined model (2573.7). These AIC scores are not comparable to the scores for the previous configurations of the model without the penguin diet length-frequencies because the model data were different.  

Similarly to the MCMC 'separate' configurations modeled without the penguin data, the separate model future SSBs were not extractable using the r4Casal2 'extract.tabular()' command but the combined model future SSBs were extractable (compare Figures 'SSB_600K.a.pdf' for the two configurations).
