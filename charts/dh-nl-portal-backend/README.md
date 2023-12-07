# dh-nl-portal-backend

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy dh-nl-portal-backend to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DenHaag | <ruben.van.duyneveldt@syntouch.nl> |  |

## Source Code

* <https://github.com/Gemeente-DenHaag/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gemeente-denhaag.github.io/helm-charts | dh-lib | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| appKind | string | `"Deployment"` |  |
| automountServiceAccountToken | bool | `false` |  |
| autoscaling.enabled | bool | `false` |  |
| command[0] | string | `"java"` |  |
| command[1] | string | `"-XX:MinRAMPercentage=20.0"` |  |
| command[2] | string | `"-XX:MaxRAMPercentage=80.0"` |  |
| command[3] | string | `"-XshowSettings:vm"` |  |
| command[4] | string | `"-Djava.security.egd=file:/dev/./urandom"` |  |
| command[5] | string | `"-jar"` |  |
| command[6] | string | `"/opt/app.jar"` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| containerPorts | list | `[]` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.enabled | bool | `true` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| env | list | `[]` |  |
| envFrom[0].secretRef.name | string | `"{{ include \"app.fullname\" . }}"` |  |
| global.keycloakUrl | string | `"https://keycloak-zgw.test.denhaag.nl"` |  |
| hostAliases | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| image.fullImage | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"crzgwpweu01.azurecr.io"` |  |
| image.repository | string | `"zgw/dh-nl-portal-backend"` |  |
| image.tag | string | `nil` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/force-ssl-redirect" | string | `"true"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.apiVersion | string | `nil` |  |
| ingress.certManager | bool | `false` |  |
| ingress.enabled | bool | `true` |  |
| ingress.extraPaths[0].backend.service.name | string | `"{{ include \"common.names.fullname\" . }}"` |  |
| ingress.extraPaths[0].backend.service.port.name | string | `"app"` |  |
| ingress.extraPaths[0].path | string | `"/api/(.*)"` |  |
| ingress.extraPaths[0].pathType | string | `"Prefix"` |  |
| ingress.hostname | string | `""` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.nginx.configurationSnippet | string | `nil` |  |
| ingress.nginx.serverSnippet | string | `nil` |  |
| ingress.path | string | `"/graphql"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.tls | bool | `true` |  |
| initContainers | list | `[]` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `2` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.tcpSocket.port | int | `8080` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| name | string | `"dh-nl-portal-backend"` |  |
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
| podLabels.public-access | string | `"allow"` |  |
| podSecurityContext.enabled | bool | `true` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.runAsGroup | int | `1000` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `1000` |  |
| priorityClassName | string | `""` |  |
| readinessProbe.enabled | bool | `false` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `60` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | int | `1` |  |
| resources.limits.memory | string | `"2Gi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"1Gi"` |  |
| service.port | int | `8080` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.failureThreshold | int | `15` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.periodSeconds | int | `20` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.tcpSocket.port | int | `8080` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
