# 2022_microbe_gan

Applying Insaf Ashrapov's *[tabgan](https://github.com/Diyago/GAN-for-tabular-data)* library to Microbial Growth Data

## Motivation

*The collection and analysis of field data serves as a backbone in ecological research, however the costs and logistics required for successful field studies make the acquisition of this data difficult. Innovations in Machine Learning have allowed for quality synthetic data generation via Generative Adversarial Networks (GAN). While most GANs deal with image data, the development of several Tabular GANs presents a potentially low cost, effective method to pad field data; reducing the cost of field excursions.*

**For a better understanding of the entire project read [Microbe_Gantics](https://github.com/ismailameen/2022_microbe_gan/blob/main/Microbe_Gantics.pdf)**



## How to use replicate the experiment

### 1. Run [Microbe_timegan.ipynb](https://github.com/ismailameen/2022_microbe_gan/blob/main/Mibcrobe_timegan.ipynb).
/newline You may need to uncomment the lines of code saving the generated datasets

### 2. Save the [raw data](https://github.com/ismailameen/2022_microbe_gan/blob/main/pcbi.1007896.s002.csv) and the generated data into the same working directory as the R data analysis file ('2022_GAN_DATA_ANALYSIS.R').

### 3. Run the data analysis file to generate the metrics and figures used in the paper. Note that results will vary due to the algorithm generating new data each time it is run.


## References
[1] Ashrapov, I. GANs for tabular data. (2020)


