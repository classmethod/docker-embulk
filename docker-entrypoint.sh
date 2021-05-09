#!/bin/sh

# Install Embulk Plugins
# You can embed this step to Dockerfile if you need quick run
if [ -e "/embulk/Gemfile" ] ; then
  /embulk/embulk bundle install
fi

/embulk/embulk "$@"
