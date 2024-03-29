# dh-nl-portal-frontend

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy dh-nl-portal-frontend to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DenHaag | <ruben.van.duyneveldt@syntouch.nl> |  |

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
| appKind | string | `"Deployment"` |  |
| automountServiceAccountToken | bool | `false` |  |
| autoscaling.enabled | bool | `false` |  |
| checksums[0] | string | `"configmaps.yaml"` |  |
| configMaps."{{ include "app.fullname" . }}".data."config.js" | string | `"{{- range $k, $v := .Values.config }}\nwindow.{{ $k}} = '{{ include \"common.tplvalues.render\" (dict \"value\" $v \"context\" $) }}';\n{{- end }}"` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| containerSecurityContext.enabled | bool | `true` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| env[0].name | string | `"TZ"` |  |
| env[0].value | string | `"Europe/Amsterdam"` |  |
| global.keycloakUrl | string | `"https://keycloak-zgw.test.denhaag.nl"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"crzgwpweu01.azurecr.io"` |  |
| image.repository | string | `"zgw/klantportaal"` |  |
| image.tag | string | `nil` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/force-ssl-redirect" | string | `"true"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.apiVersion | string | `nil` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hostname | string | `""` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.nginx.configurationSnippet | string | `nil` |  |
| ingress.nginx.serverSnippet | string | `nil` |  |
| ingress.path | string | `"/(.*)"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.tls | bool | `true` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `2` |  |
| livenessProbe.httpGet.path | string | `"/index.html"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `2` |  |
| name | string | `"klantportaal"` |  |
| nodeAffinityPreset.key | string | `""` |  |
| nodeAffinityPreset.type | string | `""` |  |
| nodeAffinityPreset.values | list | `[]` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.mountPath | string | `"/data"` |  |
| persistence.size | string | `"10Gi"` |  |
| podAffinityPreset | string | `""` |  |
| podAntiAffinityPreset | string | `"soft"` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podSecurityContext.enabled | bool | `true` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.runAsGroup | int | `1000` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `1000` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `2` |  |
| readinessProbe.httpGet.path | string | `"/index.html"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `2` |  |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"200m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| service.port | int | `8080` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.failureThreshold | int | `2` |  |
| startupProbe.httpGet.path | string | `"/index.html"` |  |
| startupProbe.httpGet.port | int | `8080` |  |
| startupProbe.initialDelaySeconds | int | `5` |  |
| startupProbe.periodSeconds | int | `30` |  |
| startupProbe.successThreshold | int | `1` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| volumeMounts[0].mountPath | string | `"/usr/share/nginx/html/config.js"` |  |
| volumeMounts[0].name | string | `"config-js-vol"` |  |
| volumeMounts[0].subPath | string | `"config.js"` |  |
| volumeMounts[1].mountPath | string | `"/tmp"` |  |
| volumeMounts[1].name | string | `"tmpfs-1"` |  |
| volumes[0].configMap.name | string | `"{{ include \"app.fullname\" . }}"` |  |
| volumes[0].name | string | `"config-js-vol"` |  |
| volumes[1].emptyDir | object | `{}` |  |
| volumes[1].name | string | `"tmpfs-1"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
