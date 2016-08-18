#!/usr/bin/ruby

require 'cinch'
require 'net/http'
require 'uri'

retort_url = 'http://www.retort.us'
imitating  = ARGV.shift

puts "Initializing bot as #{imitating}"

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "#{imitating}`"
    c.realname = "#{imitating}`"
    c.server = "irc.amazdong.com"
    c.channels = [ "#fj2" ]
  end

  on :message, /.+/ do |m, message|
    if rand(100) <= 5 # <= 4 ~~> 4% chance to talk
      #sleep rand(25)

      src = "#{retort_url}/markov/create?identifier=#{imitating}&medium=irc.amazdong.com&channel=interns"
      uri = URI.parse(src)
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      return if response.code == 500 || response.code == '500'

      m.reply response.body
    end
  end

  on :message, /#{imitating}/ do |m, message|
    puts "Imitating #{imitating}"

    src = "#{retort_url}/markov/create?identifier=#{imitating}&medium=irc.amazdong.com&channel=interns"
    uri = URI.parse(src)
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    return if response.code == 500 || response.code == '500'

    m.reply response.body
  end
end

# Start bot
bot.start
