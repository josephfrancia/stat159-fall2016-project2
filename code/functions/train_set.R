#Function that splits data up, shuffling is done with the same seed for testset and trainset function
#so that splitting is reproducible

trainset=function(data){
  set.seed(0)
  shuffled_ind=sample(1:400, 400)
  train=data[shuffled_ind[1:300],]
  return(train)
}
