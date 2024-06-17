# gzac-alg-zgw-backend chart

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy gzac-alg-zgw-backend to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DenHaag | <menno.slingerland@denhaag.nl> |  |


## Introduction

This chart allows you to deploy gzac-alg-zgw-backend.
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
```

## Source Code

* <https://github.com/Gemeente-DenHaag/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gemeente-denhaag.github.io/helm-charts | dh-lib | 0.1.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| automountServiceAccountToken | bool | `false` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `` |  |
| autoscaling.minReplicas | int | `` |  |
| autoscaling.metrics | list | `[]` |  |
| autoscaling.behavior | list | `[]` |  |
| replicaCount | int | `1` |  |
| checksums | list | `[]` |  |
| command[0] | string | `"java"` |  |
| command[1] | string | `"-XX:MinRAMPercentage=20.0"` |  |
| command[2] | string | `"-XX:MaxRAMPercentage=80.0"` |  |
| command[3] | string | `"-XshowSettings:vm"` |  |
| command[4] | string | `"-Djava.security.egd=file:/dev/./urandom"` |  |
| command[5] | string | `"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"` |  |
| command[6] | string | `"-jar"` |  |
| command[7] | string | `"/app.war"` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| configMaps | object | `{}` |  |
| containerPorts | list | `[]` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.enabled | bool | `true` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| env | object | `{}` |  |
| envFrom[0].secretRef.name | string | `"{{ include \"app.fullname\" . }}"` |  |
| extraObjects | list | `[]` |  |
| hostAliases | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| image.fullImage | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"crzgwpweu01.azurecr.io"` |  |
| image.repository | string | `"zgw/gzac-alg-zgw-backend"` |  |
| image.tag | string | `"latest"` |  |
| ingress.apiVersion | string | `nil` |  |
| ingress.certManager | bool | `false` |  |
| ingress.enabled | bool | `true` |  |
| ingress.existingTlsSecret | string | `nil` |  |
| ingress.extraPaths | object | `{}` |  |
| ingress.hostname | string | `""` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.nginx.configurationSnippet | string | `nil` |  |
| ingress.nginx.serverSnippet | string | `nil` |  |
| ingress.path | string | `"/api.*"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.tls | bool | `true` |  |
| initContainers | list | `[]` |  |
| appKind | string | `"Deployment"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `2` |  |
| livenessProbe.httpGet.path | string | `"/api/v1/ping"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| name | string | `"gzac-alg-zgw-backend"` |  |
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
| podSecurityContext.enabled | bool | `true` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.runAsGroup | int | `1000` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `1000` |  |
| priorityClassName | string | `""` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.httpGet.path | string | `"/api/v1/ping"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.periodSeconds | int | `20` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | int | `2` |  |
| resources.limits.memory | string | `"3Gi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"3Gi"` |  |
| secrets | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `8080` |  |
| service.ports | list | `[]` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| sidecar.name | string | `""` |  |
| sidecar.repository | string | `""` |  |
| sidecar.tag | string | `""` |  |
| sidecar.args | list | `[]` |  |
| sidecar.containerSecurityContext | object | `{}` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.failureThreshold | int | `20` |  |
| startupProbe.httpGet.path | string | `"/api/v1/ping"` |  |
| startupProbe.httpGet.port | int | `8080` |  |
| startupProbe.initialDelaySeconds | int | `30` |  |
| startupProbe.periodSeconds | int | `20` |  |
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
| volumeMounts[0].mountPath | string | `"/tmp"` |  |
| volumeMounts[0].name | string | `"tmpfs-1"` |  |
| volumes[0].emptyDir | object | `{}` |  |
| volumes[0].name | string | `"tmpfs-1"` |  |

> **Tip**: You can use the default [values.yaml](values.yaml)
