scaled = data/scaled-credit.csv


.PHONY: all ols ridge plsr pcr lasso compare code/script/pre_modeling_processing.R compare data/credit.csv


all: data eda regressions 


#downloads and processes credit data storing it as data/scaled_credit.csv
data: data/credit.csv code/script/pre_modeling_processing.R
	curl -o data/credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	Rscript code/scripts/pre_modeling_processing.R data/credit.csv


#performs exploratory data analysis storing relevant images and data in the data and imageas folders respectively
eda: data
	Rscript code/scripts/eda_qualitative.R data/credit.csv
	Rscript code/scripts/eda_quantitative.R data/credit.csv


#performs all 5 different types of regression
regressions:
	make ols
	make ridge
	make plsr
	make pcr
	make lasso
	make compare

#performs comparison of regression methods
compare: regressions
	Rscript code/scripts/comparing_regressions.R

#perform Ordinary Least Squares Regression Analysis
ols: 
	Rscript  code/scripts/least_squares.R $(scaled)

#Perform Ridge Regression Analysis
ridge: 
	Rscript code/scripts/ridge_regression.R $(scaled)

#Perform Partial Least Squares Regression Analysis
plsr: 
	Rscript code/scripts/partial_regression.R $(scaled)

#Perform Principal Component Regression Analysis
pcr: 
	Rscript code/scripts/pcr.R $(scaled)

#Perform Lasso Regression Analysis
lasso: 
	Rscript code/scripts/lasso.R $(scaled)

#convert report into pdf
report:
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/00-abstract.Rmd', '00-abstract.md')"
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/01-introduction.Rmd', '01-introduction.md')"
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/02-data.Rmd', '02-data.md')"
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/03-methods.Rmd', '03-methods.md')"
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/04-analysis.Rmd', '04-analysis.md')"
	cd report; Rscript -e "require(knitr); require(markdown); knit('sections/05-results.Rmd', '05-results.md')"
	cd report; pandoc 00-abstract.md 01-introduction.md 02-data.md 03-methods.md 04-analysis.md 05-results.md -o report.pdf
	cd report; rm *.md





