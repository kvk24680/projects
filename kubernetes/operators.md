# Kubernetes Operators

1. Used to **bundle**, **package** and **manage** the Kubernetes controllers. Mostly, the custom Kubernetes controllers.

2. Resources such as secrets, pods, deployments will be packaged and managed by the Kubernetes Operator.

3. Installing an application into the Kubernetes cluster using **Operators** is another method other than **YAML files**, **Helm Charts.**

### Difference between using Helm charts and Operators

Let us consider the example of **Istio**, which has both a Helm chart and an Operator available for installation.

#### What is reconciliation in Kubernetes?

Reconciliation is, in plain words, bringing the actual state of a system to a desired state as expressed by the Kubernetes resources. For example, starting as many pods, as it is declared in a deployment, especially when this declaration changes due to resource updates.

#### Structure of Helm Charts

1. Values.yaml
2. deployment.yaml
3. service.yaml ..... etc

#### Structure of Operators

1. **Bundles** - Bundle gets installed, and then the bundle again installs all the necessary resources which the Helm chart creates.

---
#### Controllers

In Kubernetes, a controller is a control loop that watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller.

#### Operators vs Controllers

Controllers and Operators are Kubernetes terms to describe control plane components that monitor resources and apply actions to modify the cluster's state. Whereas controllers are concerned with Kubernetes-level operations, operators possess domain-specific logic and are tailored to individual applications.

 ---

### Advantages of using Operators

#### 1. Reconciliation

Once the operator gets installed, it continuously watches the resources. And if someone tries to modify the resource, it denies the request.

The Operator also overrides the wrong changes. Whenever operators are written, a **reconciaiation logic** is also written. This logic is responsible for auto-correcting the resources.

#### 2. Upgrading application 

If a new version of Helm chart is released and needs to be deployed, then it has to be done manually using **Helm.** Whereas, if you set **upgrade policy** to be **automatic ** in operator, the application upgrades take place automatically

#### 3. Installation in Namespaces

A single operator can be deployed in any number of namespaces with a single operator. 

#### 4. Telemetry

The operator also provides basic telemetry information such as how many people have installed the operator, the issues. This feature can be enabled. 

### Operators can be written in

1. Go language - Includes all the features
2. Ansible based operators
3. Helm based operators

### OLM - Operator Lifecycle Management

Operator Lifecycle Manager (OLM) helps users install, update, and manage the lifecycle of Kubernetes native applications (Operators) and their associated services running across theixjr OpenShift Container Platform clusters.

### References

#### [Writing a Go based operator](https://sdk.operatorframework.io/docs/building-operators/golang/quickstart/)

#### [Kubernetes Operators by Abhishek Veeramalla](https://www.youtube.com/watch?v=VAojjIYVhGk)

#### [Operator Hub](https://operatorhub.io)