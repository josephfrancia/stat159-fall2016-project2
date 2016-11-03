scaled = data/scaled-credit.csv

.PHONY: all ols ridge plsr pcr lasso compare code/script/pre_modeling_processing.R

all:



data: data/credit.csv code/script/pre_modeling_processing.R
	curl -o data/credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	Rscript code/scripts/pre_modeling_processing.R data/credit.csv


eda: data
	Rscript -e code/script/eda_qualitative.R $(scaled)
	Rscript -e code/script/eda_quantitative.R $(scaled)

regressions:
	make ols
	make ridge
	make plsr
	make pcr
	make lasso

compare:
	Rscript code/scripts/comparing_regressions.R

ols: 
	Rscript  code/scripts/least_squares.R $(scaled)


ridge: 
	Rscript code/scripts/ridge_regression.R $(scaled)

plsr: 
	Rscript code/scripts/partial_regression.R $(scaled)

pcr: 
	Rscript code/scripts/pcr.R $(scaled)

lasso: 
	Rscript code/scripts/lasso.R $(scaled)






