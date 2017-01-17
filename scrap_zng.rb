# initial
require 'mechanize'
require 'logger'
require 'pp'

url = 'http://www.com/gallery'
url = 'http://www.ozbargain.com.au'


headers1 = {
	'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36',
	'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
	'Accept-Encoding' => 'gzip, deflate, sdch',
	'Accept-Language' =>'zh-CN,zh;q=0.8,en;q=0.6',
	'Cache-Control' => 'max-age=0',
	'Connection' => 'keep-alive',
	'Upgrade-Insecure-Requests' =>'1',
	'Referer' => url
	}

agent = Mechanize.new
agent.log = Logger.new "mech.log"
agent.request_headers = headers1

page = agent.get(url)

form = page.forms.first
form.fields.each { |f| puts f.name }

# form = page.forms.first

# pp form

abort

# ---

def download_images(image_array)
  agent = Mechanize.new
  agent.log = Logger.new "mech.log"
  agent.user_agent_alias = 'Linux Mozilla'

  image_array.each do |image_url|
    agent.get(image_url).save "1.jpg"
  end
end

url = 'http://www.ozbargain.com.au'
url = 'http://www.com'

headers1 = {
	'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36',
	'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
	'Accept-Encoding' => 'gzip, deflate, sdch',
	'Accept-Language' =>'zh-CN,zh;q=0.8,en;q=0.6',
	'Cache-Control' => 'max-age=0',
	'Connection' => 'keep-alive',
	'Upgrade-Insecure-Requests' =>'1',
	'Referer' => url
	}

agent = Mechanize.new
agent.log = Logger.new "mech.log"
agent.request_headers = headers1

respost = agent.get(url)
agent.get('http://t1.com/gallery/20440/18666/011.jpg').save "test.jpg"

sleep(10)

agent.get('http://t1.com/gallery/20440/18666/012.jpg').save "test.jpg"

abort

agent.user_agent_alias = 'Mac Safari'

page = agent.get('http://www.ozbargain.com.au')
images = page.xpath("//img[@src]")

#save image
agent.get(images.first.attributes["src"].value).save "test.jpg"

abort

agent.get(images.first.attributes["src"]).save "test.jpg"

abort

page = agent.get "http://www.google.com/"
search_form = page.form_with :name => "f"
search_form.field_with(:name => "q").value = "Hello"

search_results = agent.submit search_form
puts search_results.body

#hplogo{background:url(/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png) no-repeat}@media (-webkit-max-device-pixel-ratio:1),(max-resolution:96dpi){#hplogo{background:url(/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png) no-repeat}}

image_url = ["https://cdn.ozb.me/n/61/287361.jpg?h=043e9da6", "https://cdn.ozb.me/n/40/287340.jpg?h=cd7f571d"]
download_images(image_url)

abort
