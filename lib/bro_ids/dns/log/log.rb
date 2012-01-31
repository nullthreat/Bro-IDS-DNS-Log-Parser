require "bro_ids/dns/log/version"

module BroIds
  module Dns
    module Log
      def self.parse(filename, &block)
        parse_file(filename, &block)
      end

      private
        def self.parse_line(line)
          m =  line.split(' ')
          if m
          {:timestamp     => m[0],
           :uid           => m[1],
           :id_orig_h     => m[2],
           :id_orig_p     => m[3],
           :id_resp_h     => m[4],
           :id_resp_p     => m[5],
           :proto         => m[6],
           :trans_id      => m[7],
           :query         => m[8],
           :qclass        => m[9],
           :qclass_name   => m[10],
           :qtype         => m[11],
           :qtype_name    => m[12],
           :rcode         => m[13],
           :rcode_name    => m[14],
           :qr            => m[15],
           :aa            => m[16],
           :tc            => m[17],
           :rd            => m[18],
           :ra            => m[19],
           :z             => m[20],
           :answers       => m[21],
           :ttls          => m[22]}
        else
          {}
        end
      end

      def self.parse_file(filename, &block)
        File.foreach(filename) do |line|
          unless line =~ /^\#/
            parsed = parse_line(line)
            yield parsed
          end
        end
      end
    end
  end
end

