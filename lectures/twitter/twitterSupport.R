# EnsurePackage(x) - Installs and loads a package if necessary
EnsurePackage<-function(x)
{
  x <- as.character(x)
  if (!require(x,character.only=TRUE))
  {
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

# PrepareTwitter() - Load packages for working with twitteR
PrepareTwitter<-function()
{
  EnsurePackage("bitops")
  EnsurePackage("RCurl")
  EnsurePackage("RJSONIO")
  EnsurePackage("twitteR")
  EnsurePackage("ROAuth")
}


TweetFrame<-function(searchTerm, maxTweets)
{
  twtList<-searchTwitter(searchTerm,n=maxTweets)
  return(do.call("rbind", lapply(twtList,as.data.frame)))
}

#requesttokenurl = 'https://api.twitter.com/oauth/request_token'
#authorizeurl = 'https://api.twitter.com/oauth/authorize'
#accesstokenurl = 'https://api.twitter.com/oauth/access_token'
#appurl = 'https://dev.twitter.com/apps/5649521/show'

PrepareTwitter()

requesttokenurl = 'https://api.twitter.com/oauth/request_token'
authorizeurl = 'https://api.twitter.com/oauth/authorize'
accesstokenurl = 'https://api.twitter.com/oauth/access_token'
# Go to https://apps.twitter.com/ to get access tokens and appurl
Accesstoken = 'numbersandletters'
Accesstokensecret =  'numbersandletters'
appurl = 'https://dev.twitter.com/apps/numbershere'

credential <- OAuthFactory$new(consumerKey=Accesstoken,
                               consumerSecret=Accesstokensecret,
                               requestURL="https://api.twitter.com/oauth/request_token",
                               accessURL="https://api.twitter.com/oauth/access_token",
                               authURL="https://api.twitter.com/oauth/authorize")

credential$handshake()
registerTwitterOAuth(credential)
tweetpiratesDF <- TweetFrame('#Pirates', 500)
tweetpiratesDF2 <- TweetFrame('@Pirates', 500)
tweetsteelersDF <- TweetFrame('#steelers', 500)
tweetfluDF <- TweetFrame('#flu', 500)
EnsurePackage("ggplot2")
qplot(created, data=tweetpiratesDF2, geom="histogram")
qplot(created, data=tweetsteelersDF, geom="histogram")
qplot(created, data=tweetfluDF, geom="histogram")
tweetlowesDF <- TweetFrame("@lowes",500)
tweethomedepotDF <- TweetFrame("@homedepot",500)

sortFluDF <- tweetfluDF[order(as.integer(tweetfluDF$created)),]
sortLowesDF <- tweetlowesDF[order(as.integer(tweetlowesDF$created)),]
sortHDDF <- tweethomedepotDF[order(as.integer(tweethomedepotDF$created)),]
