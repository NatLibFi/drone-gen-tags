#!/bin/sh
if test "$DRONE_BUILD_EVENT" = 'push';then
  if test "$DRONE_BRANCH" = 'master';then
    echo "latest${PLUGIN_TAG_SUFFIX}" > .tags
  elif test "$DRONE_BRANCH" = 'main';then
    echo "latest${PLUGIN_TAG_SUFFIX}" > .tags    
  else
    echo "${DRONE_BRANCH}${PLUGIN_TAG_SUFFIX}" > .tags
  fi
elif test "$DRONE_BUILD_EVENT" = 'tag';then
  TAG="${DRONE_TAG##v}"
  MINOR_TAG="${TAG%.*}${PLUGIN_TAG_SUFFIX}"
  MAJOR_TAG="${TAG%%.*}${PLUGIN_TAG_SUFFIX}"  

  echo "${TAG}${PLUGIN_TAG_SUFFIX},${MINOR_TAG},${MAJOR_TAG}" > .tags
fi
