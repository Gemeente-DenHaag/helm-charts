# Den Haag generic application Helm chart

![Version: 0.0.19](https://img.shields.io/badge/Version-0.0.19-informational?style=flat-square)

Den Haag generic application Helm chart

This chart is a generic chart for deploying multiple apps. 

## Introduction

This chart allows you to a generic deployment. 
`name` and the `image.repository` are required to do a basic deployment. 

The charts allows you to manage the following resources:

  - AzureKeyVaultSecret
  - ConfigMaps
  - Deployment
  - HorizontalPodAutoscaler
  - Ingress
  - PersistentVolumeClaim
  - PodDisruptionBudget
  - Secrets
  - Service
  - ServiceAccount
  

## TL;DR

```console
$ helm repo add denhaag https://gemeente-denhaag.github.io/helm-charts/
$ helm install my-release denhaag/generic
```

## Examples

### Install a generic app example

```yaml
name: myapp
image:
  repository: denhaag

podAnnotations:
  test: "true"

checksums:
  - /secrets.yaml

secrets:
  env:
    stringData:
      TEST: this

configMaps:
  app:
    data:
      test: this
      wow: cool

envFrom:
  - secretRef:
      name: 'testsecret'

service:
  port: 8000
  targetPort: 80

ingress:
  enabled: true
  hostname: test.denhaag.nl

```

## Source Code

* <https://github.com/Gemeente-DenHaag/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `` |  |
| autoscaling.minReplicas | int | `` |  |
| autoscaling.metrics | list | `[]` |  |
| autoscaling.behavior | list | `[]` |  |
| replicaCount | int | `1` |  |
| checksums | list | `[]` |  |
| command | list | `[]` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| configMaps | object | `{}` |  |
| containerPorts | list | `[]` |  |
| containerSecurityContext.enabled | bool | `false` |  |
| containerSecurityContext.runAsUser | int | `1000` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| env | object | `{}` |  |
| envFrom | list | `[]` |  |
| extraObjects | list | `[]` |  |
| hostAliases | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `""` |  |
| image.repository | string | `""` |  |
| image.tag | string | `"latest"` |  |
| image.fullImage | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiVersion | string | `nil` |  |
| ingress.certManager | bool | `false` |  |
| ingress.enabled | bool | `false` |  |
| ingress.existingTlsSecret | string | `""` |  |
| ingress.hostname | string | `""` |  |
| ingress.nginx.configurationSnippet | string | `nil` |  |
| ingress.nginx.serverSnippet | string | `nil` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | bool | `false` |  |
| initContainers | list | `[]` |  |
| kind | string | `"Deployment"` |  |
| livenessProbe.enabled | bool | `false` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| name | string | `nil` |  |
| nodeAffinityPreset.key | string | `""` |  |
| nodeAffinityPreset.type | string | `""` |  |
| nodeAffinityPreset.values | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.mountPath | string | `"/data"` |  |
| persistence.size | string | `"10Gi"` |  |
| podAffinityPreset | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podAntiAffinityPreset | string | `"soft"` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podDisruptionBudget.minAvailable | int | `` |  |
| podDisruptionBudget.maxUnavailable | int | `` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.enabled | bool | `false` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| priorityClassName | string | `""` |  |
| readinessProbe.enabled | bool | `false` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `60` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| resources | object | `{}` |  |
| secrets | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.ports | list | `[]` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| sidecar.name | string | `""` |  |
| sidecar.repository | string | `""` |  |
| sidecar.tag | string | `""` |  |
| sidecar.args | list | `[]` |  |
| sidecar.containerSecurityContext | object | `{}` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.failureThreshold | int | `6` |  |
| startupProbe.initialDelaySeconds | int | `60` |  |
| startupProbe.periodSeconds | int | `30` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| syncAKV.vaultname| string | `""` |  |
| syncAKV.objectname| string | `""` |  |
| syncAKV.objecttype| string | `""` |  |
| syncAKV.output| object | `{}` |  |
| tests.httpChecks.default | bool | `false` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |


You can specify a values file for installing the chart. For example,

```console
helm install my-release -f values.yaml denhaag/generic
```

> **Tip**: You can use the default [values.yaml](values.yaml)
