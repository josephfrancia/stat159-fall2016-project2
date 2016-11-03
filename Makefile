scaled = data/scaled-credit.csv

all:



data: data/credit.csv
	curl -o $@ http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	Rscript -e code/script/pre_modeling_processing.R $@

eda: data
	Rscript -e code/script/eda_qualitative.R $(scaled)
	Rscript -e code/script/eda_quantitative.R $(scaled)

regressions: ols ridge plsr pcr lasso
	Rscript -e comparing_regressions.R

ols: code/scripts/least_squares.R
	Rscript -e $@ $(scaled)


ridge: code/scripts/ridge_regression.R
	Rscript -e $@ $(scaled)

plsr: code/scripts/partial_regression.R
	Rscript -e $@ $(scaled)

pcr: code/scripts/pcr.R
	Rscript -e $@ $(scaled)

lasso: code/scripts/lasso.R
	Rscript -e $@ $(scaled)






