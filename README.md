# lambda_ruby
A Docker image that you build and run to package your Ruby code so it can run on a node.js Lambda fiction on AWS.

Create a zip file that allows node.js to run Ruby in an AWS Lambda function

Put the Ruby code you want to run in lambda_ruby.rb

Just build the supplied Docker image.  Then run this command, replacing <DOCKER_IMAGE> with the id of the image you just built.
- docker build .
- docker run -tiP -v ${PWD}:/result <DOCKER_IMAGE> cp /lambda_ruby/ruby.zip /result
