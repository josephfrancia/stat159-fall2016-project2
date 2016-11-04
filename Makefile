scaled = data/scaled-credit.csv


.PHONY: all ols ridge plsr pcr lasso compare code/script/pre_modeling_processing.R compare data/credit.csv report slides


all: data eda regressions compare report


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
	Rscript -e "require(knitr); require(markdown); knit('report/sections/00-abstract.Rmd', '00-abstract.md')"
	Rscript -e "require(knitr); require(markdown); knit('report/sections/01-introduction.Rmd', '01-introduction.md')"
	Rscript -e "require(knitr); require(markdown); knit('report/sections/02-data.Rmd', '02-data.md')"
	Rscript -e "require(knitr); require(rmarkdown); knit('report/sections/03-methods.Rmd', '03-methods.md')"
	Rscript -e "require(knitr); require(rmarkdown); knit('report/sections/04-analysis.Rmd', '04-analysis.md')"
	Rscript -e "require(knitr); require(rmarkdown); knit('report/sections/05-results.Rmd', '05-results.md')"
	Rscript -e "require(knitr); require(rmarkdown); knit('report/sections/06-conclusion.Rmd', '06-conclusion.md')"
	pandoc *.md -o report.pdf
	rm *.md

#knit slides, kinda buggy right now
slides:
	Rscript -e "require(knitr); require(markdown); knit('slides/Slides.Rmd', 'slides.md')"
	pandoc slides.md -o slides.pdf
	rm slides.md
clean:
	rm *.pdf
	cd images; rm *
	cd data; rm *
	rm slides.pdf






