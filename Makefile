scaled = data/scaled-credit.csv

all:



data: data/credit.csv
	curl -o $@ http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	Rscript -e code/script/pre_modeling_processing.R $@

eda: data
	Rscript -e code/script/eda_qualitative.R $(scaled)
	Rscript -e code/script/eda_quantitative.R $(scaled)




