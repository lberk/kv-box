# KubeVirt & Knative Eventing / Functions Examples


## Setup
### Assumptions and Dependencies
These samples assume that you're currently running a kubernetes cluser of at least v1.33

The `kn func` cli needs to already be installed and on your path.
The `virtctl` cli needs to be already installed and on your path.

### Setup Scripts
Run `00-installer-kind.sh` to setup the kind cluster
Run `01-kn-serving.sh` to install Knative Serving (Used by knative-functions)
Run `02-kn-eventing.sh` to install Knative Eventing (Used to track and observe state changes of kubevirt vm's)
Run `03-kv-installer.sh` to install Kubevirt

## Samples
Once all components are installed, apply the yaml following directories and follow any local instructions for the demo
`samples/vm-stop-alert` - get notified in slack (via Knative Functions) that a VM has been stopped
