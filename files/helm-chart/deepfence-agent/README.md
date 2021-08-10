# Helm chart for Deepfence Agent

### Install

**Quick start**

```bash
# helm v2
helm install deepfence-agent-0.3.4.tgz \
    --name=deepfence-agent \
    --set managementConsoleIp=40.40.40.40 \
    --set deepfenceKey=aaaaa

# helm v3
helm install deepfence-agent deepfence-agent-0.3.4.tgz \
    --set managementConsoleIp=40.40.40.40 \
    --set deepfenceKey=aaaaa
```

**Detailed setup**

- Create values file
```bash
helm show values deepfence-agent-0.3.4.tgz > deepfence_agent_values.yaml
```
- Set Deepfence management console ip address
```yaml
managementConsoleIp: ""
```
- Set deepfence auth key
```yaml
# Auth: Get deepfence api key from UI -> Settings -> User Management
deepfenceKey: ""
```
- (Optional) Instance id suffix
Custom Amazon Machine Images might have same hostnames for multiple instances. This can be used to distinguish vm's. 
```yaml
# Suffix cloud instance id to hostnames
instanceIdSuffix: "N"
```
- (Optional) Set kubernetes cluster name
```yaml
# (Optional) Set custom name for the cluster and hostname prefix for agent vm's to easily identify in Deepfence UI.
# Example: prod-cluster or dev1-cluster
# It will be suffixed with hostname - prod-cluster-aks-agentpool-123456-vmss000001
clusterName: ""
```
- Install deepfence-agent helm chart with values file
```bash
# helm v2
helm install -f deepfence_agent_values.yaml deepfence-agent-0.3.4.tgz --name=deepfence-agent

# helm v3
helm install -f deepfence_agent_values.yaml deepfence-agent deepfence-agent-0.3.4.tgz
```
- Wait for pods to start up
```bash
kubectl get daemonset -n deepfence
kubectl get pods -n deepfence
```

### Delete

```bash
# helm 2
helm delete --purge deepfence-agent

# helm 3
helm delete deepfence-agent
```