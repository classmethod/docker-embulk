#!/bin/sh

# Install Embulk Plug ins
if [ -n "$PLUGINS" ] ; then
  /embulk/embulk gem install $PLUGINS
fi

/embulk/embulk "$@"
