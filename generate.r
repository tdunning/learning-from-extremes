if (!exists("x1")) {
    radius = 0.2
    N = 50000
    x1 = data.frame(y=c(0,cumsum(rnorm(N, sd=radius))), y=c(0,cumsum(rnorm(N, sd=radius))))
    x2 = data.frame(y=c(0,cumsum(rnorm(N, sd=radius))), y=c(0,cumsum(rnorm(N, sd=radius))))
    x3 = data.frame(y=c(0,cumsum(rnorm(N, sd=radius))), y=c(0,cumsum(rnorm(N, sd=radius))))
    x4 = data.frame(y=c(0,cumsum(rnorm(N, sd=radius))), y=c(0,cumsum(rnorm(N, sd=radius))))
    x5 = data.frame(y=c(0,cumsum(rnorm(N, sd=radius))), y=c(0,cumsum(rnorm(N, sd=radius))))
}

old.color = rgb(0,0,0,0.3)
width = 8
old.width = 3

png('./walk1.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-80,80), ylim=c(-45,45), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=width)
dev.off()

png('./walk2.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-80,80), ylim=c(-45,45), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=old.width, col=old.color)
lines(x2, lwd=width)
dev.off()

png('./walk3.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-80,80), ylim=c(-45,45), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=old.width, col=old.color)
lines(x2, col=old.color, lwd=old.width)
lines(x3, lwd=width)
dev.off()

png('./walk4.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-80,80), ylim=c(-45,45), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=old.width, col=old.color)
lines(x2, col=old.color, lwd=old.width)
lines(x3, col=old.color, lwd=old.width)
lines(x4, lwd=width)
dev.off()

png('./walk5.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-80,80), ylim=c(-45,45), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=old.width, col=old.color)
lines(x2, col=old.color, lwd=old.width)
lines(x3, col=old.color, lwd=old.width)
lines(x4, col=old.color, lwd=old.width)
lines(x5, lwd=width)
dev.off()

png('./walk6.png', width=3200, height=1800)
plot(x1, type='l', xlim=c(-40,40), ylim=c(-22.5, 22.5), xaxt='n', yaxt='n', mar=c(0, 0, 0, 0), xlab=NA, ylab=NA, lwd=old.width, col=old.color)
lines(x2, col=old.color, lwd=old.width)
lines(x3, col=old.color, lwd=old.width)
lines(x4, col=old.color, lwd=old.width)
lines(x5, lwd=width)
dev.off()

png('./wool7.png', width=3200, height=1800, pointsize=56)
commodities = read.delim("./wool.imf")
commodities$t = as.POSIXct(strptime(paste(commodities$Date, "-01", sep=""), format="%Y-%m-%d", tz="UTC"))
par(mar=c(2,5,0,0))
plot(PWOOLC ~ t, commodities, type='l', lwd=12, xlab=NA, cex.lab=2, yaxt='n')
dev.off()

png('./wool8.png', width=3200, height=1800, pointsize=56)
hist(diff(commodities$PWOOLC,10), breaks=50, prob=T, lwd=12, main="10-th order difference of price", yaxt='n', ylab=NA, xlab=NA, col=rgb(0,0,0,0.4), ylim=c(0,0.006))
x = -500:500
lines(x, dnorm(x, m=0, sd=70), col='red', lwd=12)
lines(x, dnorm(x, m=0, sd=sd(x)), col='red', lwd=12, lty=2)
dev.off()
