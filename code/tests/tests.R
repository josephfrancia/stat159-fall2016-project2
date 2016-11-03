#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/tests")
#test_file("tests.R")

library(testthat)
source("../functions/test_set.R")
source("../functions/train_set.R")
processed=read.csv("../../data/scaled-credit.csv")
processed=processed[,-c(1,2)]


context("Trainset and Testset Functions") 
test_that("Making sure there's no overlap between test and training sets", {
  expect_equal(sum(trainset(processed) %in% testset(processed)), 0)
})

context("Trainset Function") 
test_that("Checking reproducibility of trainset function", {
  expect_equal(sum((trainset(processed)==trainset(processed))==FALSE), 0)	
})


context("Testset Function") 
test_that("Checking reproducibility of testset function", {
  expect_equal(sum((testset(processed)==testset(processed))==FALSE), 0)	
})

