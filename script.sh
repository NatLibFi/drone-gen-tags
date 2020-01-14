#!/bin/sh
if test "$DRONE_BUILD_EVENT" = 'push';then
  if test "$DRONE_BRANCH" = 'master';then
    echo "${TAG_PREFIX}latest" > .tags
  else
    echo "${TAG_PREFIX}${DRONE_BRANCH}" > .tags
  fi
elif test "$DRONE_BUILD_EVENT" = 'tag';then
  TAG="${DRONE_TAG##v}"
  MINOR_TAG="${TAG_PREFIX}${TAG%.*}"
  MAJOR_TAG="${TAG_PREFIX}${TAG%%.*}"  

  echo "${TAG_PREFIX}${TAG},${MINOR_TAG},${MAJOR_TAG}" > .tags
fi
