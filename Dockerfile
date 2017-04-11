FROM amazonlinux

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf && \
    yum update -y && yum install -y zip

ADD http://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz /

RUN mkdir lambda_ruby && \
    tar -xvf traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz -C lambda_ruby

ADD ruby.js your_ruby.rb lambda_ruby/

RUN chmod +x /lambda_ruby/your_ruby.rb

WORKDIR /lambda_ruby

RUN zip -r ruby.zip ./
