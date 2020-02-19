# Usage: in R > source("gridmatThickness.R") 
# Commandline Usage: Rscript gridmatThickness.R

pdf("mycontourplot.pdf",width=11,height=10)

par(mar=c(4,4.5,4,1))
par(pty="m")

# Data in 3 col TSV
M <- scan(file = ".dat",
	  what=list(x="",y="",z=0),
	  flush=TRUE, comment.char="#")
M2 <- scan(file = ".dat",
	  what=list(x="",y="",z=0),
	  flush=TRUE, comment.char="#")

x <- levels(factor(M$x))
x <- as.numeric(x1)
x <- sort(x1)

y <- levels(factor(M$y))
y <- as.numeric(y1)
y <- sort(y1)

z <- M$z
dim(z) <- c(25,25)	# 
z <- t(z)		# t() depends on organization of data file
z2 <- M2$z
dim(z2) <- c(25,25)
z2 <- t(z2)

# Ensure uniform range of color ramp key across multiple plots: 
# range(<list all data sets>)
lvls <- pretty(range(z1,z2),30)

require(grDevices)
filled.contour(x, y, z,
	color.palette = rainbow,
	levels = lvls,
        asp=1,
	xlab = expression("X (" ~ ring(A) ~ ")"), 
	ylab = expression("Y (" ~ ring(A) ~ ")"),
	key.title= title(main=expression("(" ~ ring(A) ~ ")")),
        plot.axes = { contour(x,y,z, nlevels = 16,
                    drawlabels = TRUE, axes = FALSE,
                    frame.plot = FALSE, add = TRUE);
                    axis(1); axis(2) }
	)


dev.off()
