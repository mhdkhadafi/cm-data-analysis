#Import the necessary methods from tweepy library
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream

#Variables that contains the user credentials to access Twitter API 
access_token = "2740452335-s6AMwFggx44KezrOFIOurWbgbRCGiAehK4OewrP"
access_token_secret = "Gu5kQTXT5OXxdslMvkWCnczo3nnHF77KYbl10gNH2lGKf"
consumer_key = "TFQKpNgH0s8xrSsNQXBDNWrEg"
consumer_secret = "h1rI9l9fa4xkVuXR6ChP7qZoWBg4OPvOnToiheJDnFtfXxal9T"


#This is a basic listener that just prints received tweets to stdout.
class StdOutListener(StreamListener):

    def on_data(self, data):
        print data
        return True

    def on_error(self, status):
        print status


if __name__ == '__main__':

    #This handles Twitter authetification and the connection to Twitter Streaming API
    l = StdOutListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    stream = Stream(auth, l)

    #This line filter Twitter Streams to capture data by the keywords
    stream.filter(track=['paul blart', 'mall cop', 'unfriended', 'child 44','monkey kingdom','true story','alex of the venice','beyond the reach','felix and meira','monsters dark continent','dead lands'])