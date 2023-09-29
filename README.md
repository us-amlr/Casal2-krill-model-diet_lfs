# Casal2-krill-model-diet_lfs
Added krill length-frequencies from penguin diets years 1977-2020 to model configurations described in 'Casal-krill-model-mcmc

This repository contains the same Casal2 model configurations as found in 'https://github.com/us-amlr/Casal2-krill-model-mcmc', but with three additional data sets for the annual length-frequencies of krill from 1977-2020. These were obtained from diet-sampling of penguin predators of krill in the U.S. AMLR sampling strata - Adélie (ADPE), chinstrap (CHPE), and gentoo (GEPE) penguins. The penguin diet data are in 'calculate_lfs_from_diet_data/data' and the calculations of length-frequencies are in 'calculate_lfs_from_diet_data/R_krill_lfs_pengDiets.r'

For the other length-frequency data sets in these model configurations from the U.S. AMLR trawl surveys and the fishery observer data, the number of tows sampled each year provided a measure of annual sample size. Without such a corresponding measure for sample size for the penguin diet data, constant sample weightings of 30 were assigned for each length-bin, year sampled and penguin species.
