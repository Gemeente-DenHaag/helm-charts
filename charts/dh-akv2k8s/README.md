# Den Haag akv2k8s application Helm chart

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square)

Den Haag akv2k8s application Helm chart

This chart is a akv2k8s chart for syncing azurekeycvault secrets and certificates to k8s.

## Introduction

The charts allows you to manage the following resources:

  - AzureKeyVaultSecret
  

## TL;DR

```console
$ helm repo add denhaag https://gemeente-denhaag.github.io/helm-charts/
$ helm install my-release denhaag/dh-akv2k8s
```

## Examples

### Install a akv2k8s app example

```yaml
name: myname
syncAKV:
  '{{ .Values.name }}-sync-1':
    vaultname: my-key-vault
    objectname: 'my-secret'
    objecttype: secret
    output:
      secret:
        name: 'secretname-in-k8s'
        dataKey: verysecretkey
  sync-2:
    vaultname: my-key-vault
    objectname: 'my-certificate'
    objecttype: certificate
    output:
      secret:
        name: 'certname-in-k8s'
        type: kubernetes.io/tls

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
| syncAKV.vaultname| string | `""` |  |
| syncAKV.objectname| string | `""` |  |
| syncAKV.objecttype| string | `""` |  |
| syncAKV.output| object | `{}` |  |


You can specify a values file for installing the chart. For example,

```console
helm install my-release -f values.yaml denhaag/dh-akv2k8s
```

> **Tip**: You can use the default [values.yaml](values.yaml)
