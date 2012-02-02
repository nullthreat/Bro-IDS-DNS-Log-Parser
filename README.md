# bro_ids-dns-log

This gem will parse the DNS log files created by BRO IDS (http://www.bro-ids.org/) and prepare the fields to be called by name in your scripts.


## Installation
To install the bro_ids-dns-log parsing gem simply run the following command:

`gem install bro_ids-dns-log`

## Usage

`require 'bro_ids/dns/log'`
`BroIds::Dns:Log.parse('YOUR DNS LOG LOCATION HERE')`

## Example 1:
require 'bro_ids/dns/log'

  dns_log = File.open("dns.log")
  BroIds::Dns::Log.parse(dns_log) do |parsed|
    puts "At " + parsed[:timestamp] + " IP " +   parsed[:id_orig_h].to_s + " Requested " + parsed[:query] + " From " + parsed[:id_resp_h].to_s
  end


## Example 2:
require 'bro_ids/dns/log'

dns_log = File.open("dns.log")
BroIds::Dns::Log.parse(dns_log) do |parsed|
  puts parsed[:timestamp]
  puts parsed[:uid]
  puts parsed[:id_orig_h]
  puts parsed[:id_orig_p]
  puts parsed[:id_resp_h]
  puts parsed[:id_resp_p]
  puts parsed[:proto]
  puts parsed[:trans_id]
  puts parsed[:query]
  puts parsed[:qclass]
  puts parsed[:qclass_name]
  puts parsed[:qtype]
  puts parsed[:qtype_name]
  puts parsed[:rcode]
  puts parsed[:rcode_name]
  puts parsed[:qr]
  puts parsed[:aa]
  puts parsed[:tc]
  puts parsed[:rd]
  puts parsed[:ra]
  puts parsed[:z]
  puts parsed[:answers]
  puts parsed[:ttls]
end
