require "twitter-stream-patch/version"
require 'twitter'

Twitter::Error::StreamDisconnect = Class.new(Twitter::Error::ServerError)

module Twitter
  module Streaming
    class Connection
      # https://github.com/sferik/twitter/tree/6-stable/lib/twitter/streaming
      def stream(request, response)
        client_context = OpenSSL::SSL::SSLContext.new
        client         = @tcp_socket_class.new(Resolv.getaddress(request.socket_host), request.socket_port)
        ssl_client     = @ssl_socket_class.new(client, client_context)

        ssl_client.connect
        request.stream(ssl_client)
        loop do
          begin
            body = ssl_client.read_nonblock(1024)
            response << body
          rescue IO::WaitReadable
            # https://dev.twitter.com/streaming/overview/connecting
            r, _ = IO.select([ssl_client], nil, nil, 90)
            if r.nil?
              ssl_client.close
              raise Twitter::Error::StreamDisconnect
            end
            retry
          end
        end
      end
    end
  end
end
