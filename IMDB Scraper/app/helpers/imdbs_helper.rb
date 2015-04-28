module ImdbsHelper
	def self.set_new_ratings
		require 'net/http'

	    ids = ['tt3450650', 'tt3713166', 'tt1014763', 'tt3660770', 'tt2273657', 
	      'tt2977090', 'tt2911668', 'tt3685218', 'tt1935302', 'tt3399916']

	    result = []
	    ids.each do |id|
	      uri = URI('http://www.imdb.com/title/' + id + '/')
	      source = Net::HTTP.get(uri)

	      title = /<meta property='og:title' content="(.*)" \/>/.match(source)[1]
	      rating = /<span itemprop="ratingValue">(.*)<\/span><\/strong>/.match(source)[1]
	      voters = /<span itemprop="ratingCount">(.*)<\/span> users/.match(source)[1]

	      res = (title + ' - ' + rating + ' - ' + voters)
	      result.push(res)
	    end
	    user = Imdb.create(mov1: result[0], mov2: result[1], mov3: result[2], mov4: result[3], mov5: result[4],
	    	mov6: result[5], mov7: result[6], mov8: result[7], mov9: result[8], mov10: result[9])
	end
end
