require 'json'

tags = JSON.parse(`curl -sq "http://taginfo.openstreetmap.org/api/2/db/keys/values?key=craft\&sortname=count_all\&rp=500\&sortorder=desc\&page=1"`)

current_form = File.read('./models/classifications.json')

tags['data'].each_with_index do |t, i|
  puts "#{t['value']}, #{t['count']}, #{t['description']}" unless current_form.include? "craft=#{t['value']}"
end
