# zgw-dre

A Helm chart to deploy the Zaakgericht Werken Decision Rules Engine (ZGW-DRE) to Kubernetes

![Version: 1.0.7](https://img.shields.io/badge/Version-1.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.22.0](https://img.shields.io/badge/AppVersion-7.22.0-informational?style=flat-square) 

## Additional Information

### Example values.yaml

```yaml
name: zgw-dre
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
  hostname: nlportalbackend.denhaag.nl

```

## Installing the Chart

To install the chart with the release name `zgw-dre`:

```console
$ helm repo add denhaag https://gemeente-denhaag.github.io/helm-charts/
$ helm install zgw-dre denhaag/zgw-dre
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DenHaag | <menno.slingerland@denhaag.nl> |  |
| DenHaag | <kevin.kemkes@denhaag.nl> |  |

## Source Code

* <https://github.com/Gemeente-DenHaag/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gemeente-denhaag.github.io/helm-charts | dh-lib | 0.1.15 |


## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>appKind</td>
			<td>string</td>
			<td><pre lang="json">
"Deployment"
</pre>
</td>
			<td>Specifies the application resource kind.<br></td>
		</tr>
		<tr>
			<td>args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable or disable horizontal pod autoscaling (HPA).<br> HPA automatically scales the number of pods in a deployment, replication controller,  replica set, or stateful set based on observed CPU utilization (or, with custom metrics support, on some other application-provided metrics).</td>
		</tr>
		<tr>
			<td>camunda.host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Configuration for Camunda-specific settings.<br></td>
		</tr>
		<tr>
			<td>checksums</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>command[0]</td>
			<td>string</td>
			<td><pre lang="json">
"./camunda.sh --production"
</pre>
</td>
			<td>Command to start the Camunda application.<br> This is the main entrypoint command for the container.</td>
		</tr>
		<tr>
			<td>commonAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Add annotations to all the deployed resources.<br></td>
		</tr>
		<tr>
			<td>commonLabels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Add labels to all the deployed resources.<br></td>
		</tr>
		<tr>
			<td>configMaps</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerPorts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerSecurityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerSecurityContext.enabled</td>
			<td>object</td>
			<td><pre lang="yaml">
%!s(bool=true)
</pre>
</td>
			<td>Container security context.<br>
<details>
<summary>+Expand</summary>

```yaml
containerSecurityContext:
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  runAsUser: 1000
  allowPrivilegeEscalation: false
```
</details>
ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container">[link]</a></td>
		</tr>
		<tr>
			<td>containerSecurityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerSecurityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containerSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>database.credentialsSecretEnabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>database.credentialsSecretKeys.password</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>database.credentialsSecretKeys.username</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>database.credentialsSecretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>database.driver</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Configuration for database settings.<br></td>
		</tr>
		<tr>
			<td>database.url</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dnsPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterFirst"
</pre>
</td>
			<td>Optionally, change this to ClusterFirstWithHostNet in case you have 'hostNetwork: true'.<br> By default, while using host network, name resolution uses the host's DNS. If you wish nginx-controller.<br>  to keep resolving names inside the k8s network, use ClusterFirstWithHostNet.<br></td>
		</tr>
		<tr>
			<td>envFrom</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[0]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "name": "CAMUNDA_HOST_URL",
  "value": "{{ .Values.camunda.host }}"
}
</pre>
</td>
			<td>Array of environment variables to configure application settings.<br> Customize values as needed for the target environment.</td>
		</tr>
		<tr>
			<td>env[0].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.camunda.host }}"
</pre>
</td>
			<td>URL for Camunda host.<br> Example: "http://camunda.example.com"</td>
		</tr>
		<tr>
			<td>env[10].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_KEYCLOAKADMINURL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[10].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.host }}/admin/realms/{{ .Values.keycloak.realm }}"
</pre>
</td>
			<td>Admin URL for Keycloak realm.<br> Example: "http://keycloak.example.com/admin/realms/myrealm"</td>
		</tr>
		<tr>
			<td>env[11].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_CLIENTID"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[11].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.clientId }}"
</pre>
</td>
			<td>Client ID for Keycloak integration.<br> Used by plugins to authenticate with Keycloak.</td>
		</tr>
		<tr>
			<td>env[12].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_CLIENTSECRET"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[12].valueFrom</td>
			<td>object</td>
			<td><pre lang="json">
{
  "secretKeyRef": {
    "key": "{{ .Values.keycloak.clientSecret.key }}",
    "name": "{{ .Values.keycloak.clientSecret.name }}"
  }
}
</pre>
</td>
			<td>Client secret reference for Keycloak.<br> Uses Kubernetes secret reference.</td>
		</tr>
		<tr>
			<td>env[13].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_USEGROUPPATHASCAMUNDAGROUPID"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[13].value</td>
			<td>string</td>
			<td><pre lang="json">
"true"
</pre>
</td>
			<td>Use Keycloak group path as Camunda group ID.<br> This setting maps Keycloak group paths to Camunda group IDs. Example: "true" or "false"</td>
		</tr>
		<tr>
			<td>env[14].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_ADMINISTRATORGROUPNAME"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[14].value</td>
			<td>string</td>
			<td><pre lang="json">
"camunda_admin"
</pre>
</td>
			<td>Name of the administrator group in Keycloak.<br> Example: "camunda_admin"</td>
		</tr>
		<tr>
			<td>env[15].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_DISABLESSLCERTIFICATEVALIDATION"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[15].value</td>
			<td>string</td>
			<td><pre lang="json">
"false"
</pre>
</td>
			<td>Disable SSL certificate validation for Keycloak integration.<br> Example: "true" or "false" Set this to "true" for testing environments where SSL validation is not required.</td>
		</tr>
		<tr>
			<td>env[1].name</td>
			<td>string</td>
			<td><pre lang="json">
"DB_DRIVER"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[1].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.database.driver }}"
</pre>
</td>
			<td>Database driver class name.<br> Example: "org.postgresql.Driver"</td>
		</tr>
		<tr>
			<td>env[2].name</td>
			<td>string</td>
			<td><pre lang="json">
"DB_URL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[2].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.database.url }}"
</pre>
</td>
			<td>JDBC URL for connecting to the database.<br> Example: "jdbc:postgresql://hostname:5432/dbname"</td>
		</tr>
		<tr>
			<td>env[3].name</td>
			<td>string</td>
			<td><pre lang="json">
"DB_USERNAME"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[3].valueFrom</td>
			<td>object</td>
			<td><pre lang="json">
{
  "secretKeyRef": {
    "key": "{{ .Values.database.credentialsSecretKeys.username }}",
    "name": "{{ .Values.database.credentialsSecretName}}"
  }
}
</pre>
</td>
			<td>Database username from Kubernetes secret.<br> Configured via a secret key reference.</td>
		</tr>
		<tr>
			<td>env[4].name</td>
			<td>string</td>
			<td><pre lang="json">
"DB_PASSWORD"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[4].valueFrom</td>
			<td>object</td>
			<td><pre lang="json">
{
  "secretKeyRef": {
    "key": "{{ .Values.database.credentialsSecretKeys.password }}",
    "name": "{{ .Values.database.credentialsSecretName}}"
  }
}
</pre>
</td>
			<td>Database password from Kubernetes secret.<br> Configured via a secret key reference.</td>
		</tr>
		<tr>
			<td>env[5].name</td>
			<td>string</td>
			<td><pre lang="json">
"KEYCLOAK_HOST"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[5].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.host }}"
</pre>
</td>
			<td>URL for Keycloak host.<br> Example: "http://keycloak.example.com"</td>
		</tr>
		<tr>
			<td>env[6].name</td>
			<td>string</td>
			<td><pre lang="json">
"KEYCLOAK_REALM"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[6].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.realm }}"
</pre>
</td>
			<td>Keycloak realm to be used for authentication.<br> This should match the configured realm in Keycloak.</td>
		</tr>
		<tr>
			<td>env[7].name</td>
			<td>string</td>
			<td><pre lang="json">
"KEYCLOAK_CLIENT_ID"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[7].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.clientId }}"
</pre>
</td>
			<td>Keycloak client ID for the application.<br> Example: "my-app-client-id"</td>
		</tr>
		<tr>
			<td>env[8].name</td>
			<td>string</td>
			<td><pre lang="json">
"KEYCLOAK_CLIENT_SECRET"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[8].valueFrom</td>
			<td>object</td>
			<td><pre lang="json">
{
  "secretKeyRef": {
    "key": "{{ .Values.keycloak.clientSecret.key }}",
    "name": "{{ .Values.keycloak.clientSecret.name }}"
  }
}
</pre>
</td>
			<td>Keycloak client secret reference.<br> Uses Kubernetes secret reference.</td>
		</tr>
		<tr>
			<td>env[9].name</td>
			<td>string</td>
			<td><pre lang="json">
"PLUGIN_IDENTITY_KEYCLOAK_KEYCLOAKISSUERURL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env[9].value</td>
			<td>string</td>
			<td><pre lang="json">
"{{ .Values.keycloak.host }}/realms/{{ .Values.keycloak.realm }}"
</pre>
</td>
			<td>Issuer URL for Keycloak realm.<br> Example: "http://keycloak.example.com/realms/myrealm"</td>
		</tr>
		<tr>
			<td>extraIngress.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations for additional configuration options specific to the ingress controller.<br></td>
		</tr>
		<tr>
			<td>extraIngress.extraAnnotations</td>
			<td>object</td>
			<td><pre lang="yaml">
map[]
</pre>
</td>
			<td>Extra ingress annotations done as key:value pairs.<br></td>
		</tr>
		<tr>
			<td>extraIngress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Specifies the class of the ingress controller.<br> This should match the class provided by the Azure Application Gateway.<br></td>
		</tr>
		<tr>
			<td>extraIngress.nameSuffix</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Suffix to append to the ingress name, useful for distinguishing additional ingress resources.<br></td>
		</tr>
		<tr>
			<td>extraIngress.nginx</td>
			<td>object</td>
			<td><pre lang="json">
{
  "configurationSnippet": ""
}
</pre>
</td>
			<td>Nginx specific configuration snippet for additional ingress behavior customization.<br></td>
		</tr>
		<tr>
			<td>extraIngress.path</td>
			<td>string</td>
			<td><pre lang="json">
"/*"
</pre>
</td>
			<td>Define the path that this Ingress rule will apply to.<br> The `/*` indicates that this rule applies to all subpaths.<br></td>
		</tr>
		<tr>
			<td>extraIngress.pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td>Specifies how the path is matched. 'Prefix' means matching is done based on a prefix.<br> This is the most common setting for general use.</td>
		</tr>
		<tr>
			<td>extraIngress.service</td>
			<td>object</td>
			<td><pre lang="json">
{
  "port": 8080
}
</pre>
</td>
			<td>Defines the service to which traffic should be routed.<br></td>
		</tr>
		<tr>
			<td>extraObjects</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>String to fully override common.names.fullname template.<br></td>
		</tr>
		<tr>
			<td>general.debug</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable or disable debug mode for the application.<br> Defaults to 'false' to prevent excessive logging in production.</td>
		</tr>
		<tr>
			<td>global.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.imageRegistry</td>
			<td>object</td>
			<td><pre lang="yaml">
""

</pre>
</td>
			<td>Global Docker image parameters.<br> Please, note that this will override the image parameters, including dependencies, configured to use the global value.<br> Current available global Docker image parameters: imageRegistry, imagePullSecrets and storageClass.</td>
		</tr>
		<tr>
			<td>global.storageClass</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>hostAliases</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Deployment pod host aliases.<br> ref: <a href="https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/">[link]</a></td>
		</tr>
		<tr>
			<td>hostNetwork</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Controls whether the pod may use the node network namespace.<br> ref: <a href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#host-namespaces">[link]</a></td>
		</tr>
		<tr>
			<td>image.fullImage</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Set image fullImage. Can be used to set the complete URL.<br></td>
		</tr>
		<tr>
			<td>image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image.pullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Optionally specify an array of imagePullSecrets.<br> Secrets must be manually created in the namespace.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/">[link]</a></td>
		</tr>
		<tr>
			<td>image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"crzgwpweu01.azurecr.io"
</pre>
</td>
			<td>Set image registry.<br></td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"crzgwpweu01.azurecr.io/camunda/zgw-dre"
</pre>
</td>
			<td>Set image repository.<br></td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Set image tag.<br></td>
		</tr>
		<tr>
			<td>ingress.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{
  "nginx.ingress.kubernetes.io/force-ssl-redirect": "true"
}
</pre>
</td>
			<td>Annotations for additional configuration options that are specific to the Ingress controller.<br> Annotations can enable specific functionality like SSL redirection.</td>
		</tr>
		<tr>
			<td>ingress.extraAnnotations</td>
			<td>object</td>
			<td><pre lang="yaml">
map[]
</pre>
</td>
			<td>Extra ingress annotations done as key:value pairs.<br></td>
		</tr>
		<tr>
			<td>ingress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
"nginx"
</pre>
</td>
			<td>Specifies the Ingress class for Kubernetes to use.<br> This helps specify which Ingress controller should handle this Ingress if multiple controllers are installed.</td>
		</tr>
		<tr>
			<td>ingress.nginx</td>
			<td>object</td>
			<td><pre lang="json">
{
  "configurationSnippet": ""
}
</pre>
</td>
			<td>Configuration snippet for customizing Nginx Ingress behavior.<br></td>
		</tr>
		<tr>
			<td>ingress.path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td>Define the path that this Ingress rule will apply to.<br> Using `/*` means this rule applies to all subpaths under the specified host.</td>
		</tr>
		<tr>
			<td>ingress.pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td>Specifies how the path is matched. 'Prefix' means matching is done on a path prefix, split by '/'.<br></td>
		</tr>
		<tr>
			<td>ingress.service</td>
			<td>object</td>
			<td><pre lang="json">
{
  "port": 8080
}
</pre>
</td>
			<td>Defines the service to which traffic should be routed.<br> Ensure the service is defined in the same namespace as the Ingress and is reachable by the Ingress controller.<br></td>
		</tr>
		<tr>
			<td>initContainers</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Init containers that run inside the pod before Camunda is started in the main container. Use this to pull DMN's from remote repositories or to copy configuration files like production.yaml.<br> ref: <a href="https://kubernetes.io/docs/concepts/workloads/pods/init-containers/">[link]</a></td>
		</tr>
		<tr>
			<td>keycloak.clientId</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keycloak.clientSecret.key</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keycloak.clientSecret.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keycloak.host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Configuration for Keycloak settings.<br></td>
		</tr>
		<tr>
			<td>keycloak.realm</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable or disable the liveness probe.<br></td>
		</tr>
		<tr>
			<td>livenessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/engine-rest/engine",
  "port": 8080
}
</pre>
</td>
			<td>HTTP GET method used by liveness probe to check health.<br></td>
		</tr>
		<tr>
			<td>livenessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
120
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>minReadySeconds</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>How many seconds a pod needs to be ready before killing the next, during update</td>
		</tr>
		<tr>
			<td>name</td>
			<td>string</td>
			<td><pre lang="json">
"zgw-dre"
</pre>
</td>
			<td>Specifies the application name (required to be set).<br></td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>String to partially override common.names.fullname template (will maintain the release name).<br></td>
		</tr>
		<tr>
			<td>nodeAffinityPreset.key</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nodeAffinityPreset.type</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nodeAffinityPreset.values</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>persistence.accessMode</td>
			<td>string</td>
			<td><pre lang="json">
"ReadWriteMany"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>persistence.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>persistence.existingClaim</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>persistence.storageClass</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podAffinityPreset</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Pod annotations.<br> ref: <a href="https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/">[link]</a></td>
		</tr>
		<tr>
			<td>podAntiAffinityPreset</td>
			<td>string</td>
			<td><pre lang="json">
"soft"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podDisruptionBudget.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podDisruptionBudget.minAvailable</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podLabels</td>
			<td>object</td>
			<td><pre lang="json">
{
  "public-access": "allow"
}
</pre>
</td>
			<td>Specifies the pod labels.<br></td>
		</tr>
		<tr>
			<td>podSecurityContext.enabled</td>
			<td>object</td>
			<td><pre lang="yaml<br>">
%!s(bool=true)
</pre>
</td>
			<td>Pod securityContext.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod">[link]</a></td>
		</tr>
		<tr>
			<td>podSecurityContext.fsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podSecurityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podSecurityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>priorityClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable or disable the readiness probe.<br></td>
		</tr>
		<tr>
			<td>readinessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/engine-rest/engine",
  "port": 8080
}
</pre>
</td>
			<td>HTTP GET method used by readiness probe to check if the container is ready to handle traffic.<br></td>
		</tr>
		<tr>
			<td>readinessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
20
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Set the number of replicas.<br></td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": 0.5,
  "memory": "1.5Gi"
}
</pre>
</td>
			<td>Define the resource limits for the container.<br></td>
		</tr>
		<tr>
			<td>resources.requests</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": 0.5,
  "memory": "1Gi"
}
</pre>
</td>
			<td>Define the resource requests for the container.<br></td>
		</tr>
		<tr>
			<td>secrets</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Provide any additional service annotations.<br></td>
		</tr>
		<tr>
			<td>service.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Provide any additional service labels.<br></td>
		</tr>
		<tr>
			<td>service.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.targetPort</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td>Kubernetes service type and port number.<br></td>
		</tr>
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations to add to the service account.<br></td>
		</tr>
		<tr>
			<td>serviceAccount.automountServiceAccountToken</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Controls whether the container automatically mounts the ServiceAccount's API credentials.<br> In the serviceaccount/v1 this defaults to true, so also in this Helm chart. recommended: false.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#opt-out-of-api-credential-automounting">[link]</a></td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Specifies whether a service account should be created.<br></td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The name of the service account to use.<br> If not set and create is true, a name is generated using the fullname template.<br></td>
		</tr>
		<tr>
			<td>sidecar</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable or disable the startup probe.<br></td>
		</tr>
		<tr>
			<td>startupProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.httpGet</td>
			<td>object</td>
			<td><pre lang="json">
{
  "path": "/engine-rest/engine",
  "port": 8080
}
</pre>
</td>
			<td>HTTP GET method used by startup probe to check if the application has started.<br></td>
		</tr>
		<tr>
			<td>startupProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
120
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>syncAKV</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>tests.httpChecks.default</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>topologySpreadConstraints</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>updateStrategy.type</td>
			<td>object</td>
			<td><pre lang="yaml">
RollingUpdate

</pre>
</td>
			<td>Set up update strategy for installation. Set to Recreate if you use persistent volume that cannot be mounted by more than one pod to ensure the pods are destroyed first.
<details>
<summary>+Expand</summary>

```yaml
updateStrategy:
 type: RollingUpdate
 rollingUpdate:
   maxSurge: 25%
   maxUnavailable: 25%
```
</details></td>
		</tr>
		<tr>
			<td>volumeMounts[0]</td>
			<td>list</td>
			<td><pre lang="yaml">
# -- (list) Array to add volume mounts (normally used with volumes).
# @notationType -- yaml
# @raw
#
# <details>
# <summary>+Expand</summary>
#
# ```yaml
# - mountPath: /parentdir/subdir
#   name: storage
#   subPath: dirUnderMountPath/subdir
# ```
# </details>
# ref: <a href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#volumes-2">[link]</a>
name: tomcat-tmp-dir
mountPath: /tmp

</pre>
</td>
			<td>Array to add volume mounts (normally used with volumes).

<details>
<summary>+Expand</summary>

```yaml
- mountPath: /parentdir/subdir
  name: storage
  subPath: dirUnderMountPath/subdir
```
</details>
ref: <a href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#volumes-2">[link]</a></td>
		</tr>
		<tr>
			<td>volumeMounts[1].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/camunda/logs"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[1].name</td>
			<td>string</td>
			<td><pre lang="json">
"camunda-logs"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[2].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/camunda/work"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[2].name</td>
			<td>string</td>
			<td><pre lang="json">
"camunda-work"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[3].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/temp"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[3].name</td>
			<td>string</td>
			<td><pre lang="json">
"dmn-volume"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[4].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/temp/config"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[4].name</td>
			<td>string</td>
			<td><pre lang="json">
"zgw-dre-config"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[5].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/camunda/configuration/resources/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[5].name</td>
			<td>string</td>
			<td><pre lang="json">
"dmndir"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[6].mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/camunda/configuration/production.yml"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[6].name</td>
			<td>string</td>
			<td><pre lang="json">
"configdir"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts[6].subPath</td>
			<td>string</td>
			<td><pre lang="json">
"production.yml"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumes[0]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "configMap": {
    "name": "zgw-dre-config"
  },
  "name": "zgw-dre-config"
}
</pre>
</td>
			<td>Volume sourced from a ConfigMap for Camunda BPM Platform configuration.<br></td>
		</tr>
		<tr>
			<td>volumes[1]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "dmn-volume"
}
</pre>
</td>
			<td>Temporary storage volume for DMN files, provides an empty directory that is erased when the pod is removed.<br></td>
		</tr>
		<tr>
			<td>volumes[2]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "dmndir"
}
</pre>
</td>
			<td>Temporary directory for storing DMN related files during runtime.<br></td>
		</tr>
		<tr>
			<td>volumes[3]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "configdir"
}
</pre>
</td>
			<td>Temporary directory for dynamic configuration files during application runtime.<br></td>
		</tr>
		<tr>
			<td>volumes[4]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "camunda-logs"
}
</pre>
</td>
			<td>Temporary emptyDir volume for Camunda logs.<br> Ensures logging data is stored in a non-persistent volume and is cleared when the pod is deleted.</td>
		</tr>
		<tr>
			<td>volumes[5]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "camunda-work"
}
</pre>
</td>
			<td>Temporary storage volume for Camunda work files.<br> Used for transient data storage that does not need to persist once the pod is terminated.</td>
		</tr>
		<tr>
			<td>volumes[6]</td>
			<td>object</td>
			<td><pre lang="json">
{
  "emptyDir": {},
  "name": "tomcat-tmp-dir"
}
</pre>
</td>
			<td>Temporary directory for Tomcat temporary files used by Camunda.<br> Helps isolate and manage temporary data used by the Tomcat server.</td>
		</tr>
	</tbody>
</table>



> **Tip**: You can use the default [values.yaml](values.yaml)


----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)