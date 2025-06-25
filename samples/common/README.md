# Common Setup

The common part of these examples is a Knative Eventing Api Server Source, which uses a Knative Broker as a target.

The Api Server Source is configured to filter any changes to Kubernetes Resources that match
```yaml
apiVersion: kubevirt.io/v1
kind: VirtualMachine
```
and forward them to the Knative Eventing Broker via
```yaml
sink:
  ref:
    apiVersion: eventing.knative.dev/v1
    kind: Broker
    name: inmem-broker
```
