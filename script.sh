#!/bin/sh
if test "$DRONE_BUILD_EVENT" = 'push';then
  if test "$DRONE_BRANCH" = 'master';then
    echo 'latest' > .tags
  else
    echo "$DRONE_BRANCH" > .tags
  fi
elif test "$DRONE_BUILD_EVENT" = 'tag';then
  TAG="${DRONE_TAG##v}"
  MAJOR_TAG="${TAG%%.*}"

  echo "$TAG,$MAJOR_TAG" > .tags
fi
