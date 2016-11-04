scaled = data/scaled-credit.csv

.PHONY: all ols ridge plsr pcr lasso compare code/script/pre_modeling_processing.R

all:



data: data/credit.csv code/script/pre_modeling_processing.R
	curl -o data/credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	Rscript code/scripts/pre_modeling_processing.R data/credit.csv


eda: data
	Rscript code/scripts/eda_qualitative.R data/credit.csv
	Rscript code/scripts/eda_quantitative.R data/credit.csv

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






