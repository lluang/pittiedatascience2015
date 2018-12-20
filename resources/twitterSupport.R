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

requesttokenurl = 'https://api.twitter.com/oauth/request_token'
authorizeurl = 'https://api.twitter.com/oauth/authorize'
accesstokenurl = 'https://api.twitter.com/oauth/access_token'
appurl = 'https://dev.twitter.com/apps/5649521/show'

PrepareTwitter()

credential <- OAuthFactory$new(consumerKey=consumerkey,
                               consumerSecret=consumersecret,
                               requestURL="https://api.twitter.com/oauth/request_token",
                               accessURL="https://api.twitter.com/oauth/access_token",
                               authURL="https://api.twitter.com/oauth/authorize")

credential$handshake()
registerTwitterOAuth(credential)
tweetpiratesDF <- TweetFrame('#Pirates', 500)
tweetsteelersDF <- TweetFrame('#steelers', 500)
tweetfluDF <- TweetFrame('#flu', 500)
EnsurePackage(ggplot2)
qplot(created, data=tweetpiratesDF, geom="histogram")
qplot(created, data=tweetsteelersDF, geom="histogram")
qplot(created, data=tweetfluDF, geom="histogram")