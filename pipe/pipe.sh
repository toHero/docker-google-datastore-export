#!/usr/bin/env bash

# Cleanup version on GCP app engine, https://cloud.google.com/appengine/
#
# Required globals:
#   KEY_FILE
#   PROJECT
#   DESTINATION
#
# Optional globals:
#   DEBUG

source "$(dirname "$0")/common.sh"
enable_debug

# mandatory parameters
KEY_FILE=${KEY_FILE:?'KEY_FILE variable missing.'}
PROJECT=${PROJECT:?'PROJECT variable missing.'}
DESTINATION=${DESTINATION:?'DESTINATION variable missing.'}

info "Setting up environment".

run 'echo "${KEY_FILE}" | base64 -d >> /tmp/key-file.json'
run gcloud auth activate-service-account --key-file /tmp/key-file.json --quiet ${gcloud_debug_args}
run gcloud config set project $PROJECT --quiet ${gcloud_debug_args}


info "Launch datastore export to gs://${DESTINATION} ..."
gcloud datastore export gs://${DESTINATION} --project=${PROJECT} --async
success "Datastore Export async successful."
