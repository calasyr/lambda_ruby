# lambda_ruby
Get your Ruby running on Lambda

On 2016/12/09 the AWS Compute Blog described a technique for running unsupported languages on AWS Lambda.

  https://aws.amazon.com/blogs/compute/scripting-languages-for-aws-lambda-running-php-ruby-and-go/

I gave it a try for Ruby and it worked for me.  So I created a Docker image that automates most of the work.

Put your Ruby into your_ruby.rb, build the image and then run a new container to get the zip file for Lambda.

To build the supplied Docker image from the root directory of this repo.  
$ docker build .

Then run this command, replacing <DOCKER_IMAGE> with the id of the image you just built.
$ docker run -tiP -v ${PWD}:/result <DOCKER_IMAGE> cp /lambda_ruby/ruby.zip /result

This should copy ruby.zip to this same directory.  

You can now upload this 7 megayte file to a node.js AWS Lambda.  This Lambda function will need a handler called 'ruby.handler'.

And you will need an execution role that can write to CloudWatch logs.  A role with the AWSLambdaBasicExecutionRole managed policy, for example.
