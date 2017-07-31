#!/usr/bin/env Rscript

"Usage: upset.R INPUT OUTPUT
Arguments:
   INPUT    the input file name  
   OUTPUT   the output filename" -> doc


library("docopt")
opts     <- docopt(doc)

input    <- opts$INPUT
output   <- opts$OUTPUT

library('UpSetR')

mydata <- read.table(input, header=T, sep="\t",comment.char = '', quote = '')

pdf(output)
upset(mydata, sets =names(mydata)[-1], order.by = "freq", empty.intersections = "on")
dev.off()
