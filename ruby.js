const exec = require('child_process').exec;

exports.handler = function(event, context) {
    var quotedEventString = '\'' + JSON.stringify(event) + '\'';

    console.log("quotedEventString is " + quotedEventString);

    const child = exec('./your_ruby.rb ' + quotedEventString, (result) => {
        // Resolve with result of process
        context.done(result);
    });

    // Log process stdout and stderr
    child.stdout.on('data', console.log);
    child.stderr.on('data', console.error);
}
