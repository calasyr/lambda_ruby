FROM amazonlinux

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf

RUN yum update -y
RUN yum install -y wget zip

RUN wget http://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz

RUN mkdir lambda_ruby

RUN tar -xvf traveling-ruby-20150715-2.2.2-linux-x86_64.tar.gz -C lambda_ruby

COPY ruby.js lambda_ruby

COPY your_ruby.rb lambda_ruby

RUN chmod +x /lambda_ruby/your_ruby.rb

WORKDIR /lambda_ruby

RUN zip -r ruby.zip ./
