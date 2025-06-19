#!/usr/bin/env bash

set -e

# Turn colors in this script off by setting the NO_COLOR variable in your
# environment to any value:
#
# $ NO_COLOR=1 test.sh
NO_COLOR=${NO_COLOR:-""}
if [ -z "$NO_COLOR" ]; then
  header=$'\e[1;33m'
  reset=$'\e[0m'
else
  header=''
  reset=''
fi

kubevirt_version="v1.5.2"
kubevirt_url="https://github.com/kubevirt/kubevirt/releases/download/${kubevirt_version}"

function header_text {
  echo "$header$*$reset"
}

header_text "Using KubeVirt Version:         ${kubevirt_version}"

header_text "Setting up KubeVirt Operator"
kubectl apply --filename $kubevirt_url/kubevirt-operator.yaml

header_text "Setting up KubeVirt CRDs"
kubectl apply --filename $kubevirt_url/kubevirt-cr.yaml

header_text "Waiting for KubeVirt to become ready"
kubectl wait deployment --all --timeout=-1s --for=condition=Available -n kubevirt
