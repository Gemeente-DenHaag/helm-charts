# smartdocuments-webapps

A Helm chart to deploy smartdocuments-webapps to Kubernetes

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

## Additional Information

### Example values.yaml

```yaml
name: smartdocuments-webapps
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

To install the chart with the release name `smartdocuments-webapps`:

```console
$ helm repo add denhaag https://gemeente-denhaag.github.io/helm-charts/
$ helm install smartdocuments-webapps denhaag/smartdocuments-webapps
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DenHaag | <menno.slingerland@denhaag.nl> |  |

## Source Code

* <https://github.com/Gemeente-DenHaag/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gemeente-denhaag.github.io/helm-charts | dh-lib | 0.1.9 |


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
			<td>Affinity for pod assignment.<br> Note: podAffinityPreset, podAntiAffinityPreset, and  nodeAffinityPreset will be ignored when it's set.<br> ref: <a href="https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity">[link]</a></td>
		</tr>
		<tr>
			<td>appKind</td>
			<td>string</td>
			<td><pre lang="json">
"Deployment"
</pre>
</td>
			<td>Specifies the application resource kind.</td>
		</tr>
		<tr>
			<td>args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Override default container args (useful when using custom images)</td>
		</tr>
		<tr>
			<td>automountServiceAccountToken</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Controls whether the container automatically mounts the ServiceAccount's API credentials.<br> In the pod/v1 this defaults to true, so also in this helm chart. recommended: false.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#opt-out-of-api-credential-automounting">[link]</a></td>
		</tr>
		<tr>
			<td>autoscaling</td>
			<td>object</td>
			<td><pre lang="yaml">
enabled: false

</pre>
</td>
			<td>Autoscaling configuration.

<details>
<summary>+Expand</summary>

```yaml
autoscaling:
  enabled: true
  minReplicas: 1
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 80
    - type: Resource
      resource:
       name: memory
       target:
          type: AverageValue
          averageValue: 1800Mi
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 300
```
</details></td>
		</tr>
		<tr>
			<td>checksums</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array of templates paths to automatically adds checksum annotation for.

<details>
<summary>+Expand</summary>

```yaml
checksums:
  - secrets.yaml

```
</details></td>
		</tr>
		<tr>
			<td>command</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>Override default container command (useful when using custom images)</td>
		</tr>
		<tr>
			<td>commonAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Add annotations to all the deployed resources.</td>
		</tr>
		<tr>
			<td>commonLabels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Add labels to all the deployed resources.</td>
		</tr>
		<tr>
			<td>configMaps</td>
			<td>object</td>
			<td><pre lang="yaml">
'{{ include "app.fullname" . }}':
    data:
        logback.xml: |-
            <?xml version="1.0" encoding="UTF-8"?>
            <configuration>
              <property name="max.retention.days" value="365"/>
              <contextListener class="ch.qos.logback.classic.jul.LevelChangePropagator">
                <!-- reset all previous level configurations of all j.u.l. loggers -->
                <resetJUL>true</resetJUL>
              </contextListener>
              <appender name="SMARTDOCUMENTS" class="ch.qos.logback.classic.sift.SiftingAppender">
                <discriminator>
                <key>tenant</key>
                <defaultValue>.</defaultValue>
                </discriminator>
                <sift>
                  <appender name="SMARTDOCUMENTS-${tenant}" class="ch.qos.logback.core.rolling.RollingFileAppender">
                    <file>${catalina.base}/logs/${tenant}/smartdocuments.log</file>
                    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
                      <fileNamePattern>${catalina.base}/logs/${tenant}/smartdocuments.%d{yyyyMMdd}.log.zip</fileNamePattern>
                      <maxHistory>${max.retention.days}</maxHistory>
                    </rollingPolicy>
                    <append>true</append>
                    <encoder>
                      <charset>utf-8</charset>
                      <pattern>%d{HH:mm:ss.SSS} [%-5p] [%cn] [%-5.16t] [%c:%L] - %m %X{username} %X{userid} %n</pattern>
                    </encoder>
                  </appender>
                </sift>
              </appender>
              <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
                <!-- encoders are assigned the type ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
                <encoder>
                  <charset>utf-8</charset>
                  <pattern>%d{HH:mm:ss.SSS} [%-5p] [%cn] [%-5.16t] [%c:%L] - %m %X{username} %X{userid} %n</pattern>
                </encoder>
              </appender>
              <root level="DEBUG">
                <appender-ref ref="SMARTDOCUMENTS"/>
                <appender-ref ref="STDOUT"/>
              </root>
            </configuration>

</pre>
</td>
			<td>Populate сonfigMaps for the application.

<details>
<summary>+Expand</summary>

```yaml
configMaps:
  app:
    data:
      dbURL: {{ .Values.dbUser }}@{{ .Values.dbPassword }}:{{ .Values.dbPort }}
```
The above example will create a configMap with name common.names.fullname-app.

```yaml
configMaps:
  '{{ include "app.fullname" . }}':
    data:
      test.xml: |-
        <?xml version="1.0" encoding="UTF-8"?>
        <configuration>
          <property name="test"/>
        </configuration>
```
The above example will create a configMap with name common.names.fullname.
</details></td>
		</tr>
		<tr>
			<td>containerPorts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Application container ports definitions (for use with service.ports).
<details>
<summary>+Expand</summary>

```yaml
containerPorts:
  - name: http
    containerPort: 8080
    protocol: TCP
```
</details></td>
		</tr>
		<tr>
			<td>containerSecurityContext</td>
			<td>object</td>
			<td><pre lang="yaml">
enabled: true
readOnlyRootFilesystem: false
allowPrivilegeEscalation: false

</pre>
</td>
			<td>Container security context.
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
			<td>dnsPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterFirst"
</pre>
</td>
			<td>Optionally, change this to ClusterFirstWithHostNet in case you have 'hostNetwork: true'.<br> By default, while using host network, name resolution uses the host's DNS. If you wish nginx-controller  to keep resolving names inside the k8s network, use ClusterFirstWithHostNet.</td>
		</tr>
		<tr>
			<td>env</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>An array to add env vars.

<details>
<summary>+Expand</summary>

```yaml
env:
 - name: TEST_VAR
   value: test
```
</details></td>
		</tr>
		<tr>
			<td>envFrom</td>
			<td>list</td>
			<td><pre lang="yaml">
- secretRef:
    name: '{{ include "app.fullname" . }}'

</pre>
</td>
			<td>Array of sources to populate environment variables in the container from.

<details>
<summary>+Expand</summary>

```yaml
envFrom:
  - configMapRef:
      name: special-config
  - secretRef:
      name: '{{ include "app.fullname" . }}-env'
```
</details>
ref: <a href="https://v1-18.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#envfromsource-v1-core">[link]</a></td>
		</tr>
		<tr>
			<td>extraIngress.annotations</td>
			<td>object</td>
			<td><pre lang="yaml">
kubernetes.io/ingress.class: 'azure/application-gateway-ext'
appgw.ingress.kubernetes.io/ssl-redirect: 'true'
appgw.ingress.kubernetes.io/health-probe-path: /smartcontrol/SmartControl/Login.jsp
appgw.ingress.kubernetes.io/health-probe-status-codes: "401"

</pre>
</td>
			<td>Ingress annotations done as key:value pairs.<br> For a full list of possible ingress annotations, please see<br> If certManager is set to true, annotation kubernetes.io/tls-acme: "true" will automatically be set.<br> ref: <a href="https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md">[link]</a></td>
		</tr>
		<tr>
			<td>extraIngress.apiVersion</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override API Version (automatically detected if not set).</td>
		</tr>
		<tr>
			<td>extraIngress.certManager</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Set this to true in order to add the corresponding annotations for cert-manager.</td>
		</tr>
		<tr>
			<td>extraIngress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Configure a second ingress resource that allows you to access the app installation.<br> Set to true to enable ingress.<br> ref: <a href="https://kubernetes.io/docs/user-guide/ingress/">[link]</a></td>
		</tr>
		<tr>
			<td>extraIngress.existingTlsSecret</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Specify a tls secret which already exists. tls must be set to true.</td>
		</tr>
		<tr>
			<td>extraIngress.extraHosts</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>The list of additional hostnames to be covered with this ingress record.<br>
Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array.

<details>
<summary>+Expand</summary>

```yaml
extraHosts:
- name: app.local
  path: /
```
</details></td>
		</tr>
		<tr>
			<td>extraIngress.extraPaths</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>Any additional arbitrary paths that may need to be added to the ingress under the main host.
For example: The ALB ingress controller requires a special rule for handling SSL redirection.

<details>
<summary>+Expand</summary>

```yaml
extraPaths:
- path: /api/*
  pathType: Prefix
  backend:   
    service:
      name: '{{ include "common.names.fullname" . }}'
      port:
        name: app
```
</details></td>
		</tr>
		<tr>
			<td>extraIngress.extraTls</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>The tls configuration for additional hostnames to be covered with this ingress record.<br>

<details>
<summary>+Expand</summary>

```yaml
extraTls:
- hosts:
    - app.local
  secretName: app.local-tls
```
</details>
ref: <a href="https://kubernetes.io/docs/concepts/services-networking/ingress/#tls">[link]</a></td>
		</tr>
		<tr>
			<td>extraIngress.hostname</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>When the ingress is enabled, a host pointing to this will be created.</td>
		</tr>
		<tr>
			<td>extraIngress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Set the ingressclassname</td>
		</tr>
		<tr>
			<td>extraIngress.nameSuffix</td>
			<td>string</td>
			<td><pre lang="json">
"-ext"
</pre>
</td>
			<td>Set the nameSuffix to extend the extraIngress name {{ include "common.names.fullname" . }}

<details>
<summary>+Expand</summary>

```yaml
extraIngress:
  enabled: true
  nameSuffix: "-ext"
```
</details></td>
		</tr>
		<tr>
			<td>extraIngress.path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td>The Path for the ingress controller.</td>
		</tr>
		<tr>
			<td>extraIngress.pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td>Ingress Path type.</td>
		</tr>
		<tr>
			<td>extraIngress.tls</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable TLS configuration for the hostname defined at ingress.hostname parameter.<br> TLS certificates will be retrieved from a TLS secret with name: {{- printf "%s-tls" .Values.ingress.hostname }}<br> You can use the ingress.secrets parameter to create this TLS secret or relay on cert-manager to create it.</td>
		</tr>
		<tr>
			<td>extraObjects</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Add extra list of kubernetes objects to deploy (value evaluted as a template).

<details>
<summary>+Expand</summary>

```yaml
- apiVersion: v1
  kind: Pod
  metadata:
    name: nginx
  spec:
   containers:
   - name: nginx
     image: nginx:1.14.2
     ports:
     - containerPort: 80
```
The above example will create 1 extra object: pod
</details></td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>String to fully override common.names.fullname template.</td>
		</tr>
		<tr>
			<td>global</td>
			<td>object</td>
			<td><pre lang="yaml">
imageRegistry: ""
imagePullSecrets: []
storageClass: ""
keycloakUrl: "https://keycloak-zgw.test.denhaag.nl"

</pre>
</td>
			<td>Global Docker image parameters.<br> Please, note that this will override the image parameters, including dependencies, configured to use the global value.<br> Current available global Docker image parameters: imageRegistry, imagePullSecrets and storageClass.</td>
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
			<td>Set image fullImage. Can be used the set the complete url.</td>
		</tr>
		<tr>
			<td>image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td>Set image pullPolicy.<br> Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'<br> ref: <a href="https://kubernetes.io/docs/user-guide/images/#pre-pulling-images">[link]</a></td>
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
			<td>Set image registry.</td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"sdweb/webapps"
</pre>
</td>
			<td>Set image repository.</td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Set image tag.</td>
		</tr>
		<tr>
			<td>ingress.annotations</td>
			<td>object</td>
			<td><pre lang="yaml">
kubernetes.io/ingress.class: 'azure/application-gateway-int'
appgw.ingress.kubernetes.io/ssl-redirect: 'true'
appgw.ingress.kubernetes.io/health-probe-path: /smartcontrol/SmartControl/Login.jsp
appgw.ingress.kubernetes.io/health-probe-status-codes: "401"

</pre>
</td>
			<td>Ingress annotations done as key:value pairs.<br> For a full list of possible ingress annotations, please see:<br> If certManager is set to true, annotation kubernetes.io/tls-acme: "true" will automatically be set.<br> ref: <a href="https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md">[link]</a></td>
		</tr>
		<tr>
			<td>ingress.apiVersion</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override API Version (automatically detected if not set).</td>
		</tr>
		<tr>
			<td>ingress.certManager</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Set this to true in order to add the corresponding annotations for cert-manager.</td>
		</tr>
		<tr>
			<td>ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Configure the ingress resource that allows you to access the app installation.<br> Set to true to enable ingress.<br> ref: <a href="https://kubernetes.io/docs/user-guide/ingress/">[link]</a></td>
		</tr>
		<tr>
			<td>ingress.existingTlsSecret</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Specify a tls secret which already exists. tls must be set to true.</td>
		</tr>
		<tr>
			<td>ingress.extraHosts</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>The list of additional hostnames to be covered with this ingress record.
Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array.

<details>
<summary>+Expand</summary>

```yaml
extraHosts:
- name: app.local
  path: /
```
</details></td>
		</tr>
		<tr>
			<td>ingress.extraPaths</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>Any additional arbitrary paths that may need to be added to the ingress under the main host.
For example: The ALB ingress controller requires a special rule for handling SSL redirection.

<details>
<summary>+Expand</summary>

```yaml
extraPaths:
- path: /api/*
  pathType: Prefix
  backend:   
    service:
      name: '{{ include "common.names.fullname" . }}'
      port:
        name: app
```
</details></td>
		</tr>
		<tr>
			<td>ingress.extraTls</td>
			<td>list</td>
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>The tls configuration for additional hostnames to be covered with this ingress record.

<details>
<summary>+Expand</summary>

```yaml
extraTls:
- hosts:
    - app.local
  secretName: app.local-tls
```
</details>
ref: <a href="https://kubernetes.io/docs/concepts/services-networking/ingress/#tls">[link]</a></td>
		</tr>
		<tr>
			<td>ingress.hostname</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>When the ingress is enabled, a host pointing to this will be created.</td>
		</tr>
		<tr>
			<td>ingress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Set the ingressclassname</td>
		</tr>
		<tr>
			<td>ingress.nginx</td>
			<td>object</td>
			<td><pre lang="yaml">
configurationSnippet:
serverSnippet:

</pre>
</td>
			<td>Adds location and server snippets annotations for ingress-nginx.

<details>
<summary>+Expand</summary>

```yaml
nginx:
  serverSnippet: |
    ## Redirect mobile
    set $agentflag 0;
    if ($http_user_agent ~* "(Mobile)" ){
      set $agentflag 1;
    }
    if ( $agentflag = 1 ) {
      return 301 https://m.example.com;
    }
```
</details>
ref: <a href ="https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#configuration-snippet">[link]</a><br>
ref: <a href ="https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#server-snippet">[link]</a></td>
		</tr>
		<tr>
			<td>ingress.path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td>The Path for the ingress controller.</td>
		</tr>
		<tr>
			<td>ingress.pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td>Ingress Path type.</td>
		</tr>
		<tr>
			<td>ingress.tls</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable TLS configuration for the hostname defined at ingress.hostname parameter.<br> TLS certificates will be retrieved from a TLS secret with name: {{- printf "%s-tls" .Values.ingress.hostname }}.<br> You can use the ingress.secrets parameter to create this TLS secret or relay on cert-manager to create it.</td>
		</tr>
		<tr>
			<td>initContainers</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Add init containers to the Pod.
<details>
<summary>+Expand</summary>

```yaml
- name: your-image-name
  image: your-image
  imagePullPolicy: Always
  ports:
  - name: portname
    containerPort: 1234
```
</details></td>
		</tr>
		<tr>
			<td>livenessProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Configure options for liveness probes.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes">[link]</a></td>
		</tr>
		<tr>
			<td>livenessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
2
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/smartcontrol/SmartControl/Login.jsp"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.httpGet.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>livenessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
60
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
			<td>name</td>
			<td>string</td>
			<td><pre lang="json">
"smartdocuments-webapps"
</pre>
</td>
			<td>Specifies the application name (required to be set).</td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>String to partially override common.names.fullname template (will maintain the release name).</td>
		</tr>
		<tr>
			<td>nodeAffinityPreset</td>
			<td>object</td>
			<td><pre lang="yaml">
## Node affinity type
## Allowed values: soft, hard
##
type: ""
## Node label key to match
## E.g.
## key: "kubernetes.io/e2e-az-name"
##
key: ""
## Node label values to match
## E.g.
## values:
##   - e2e-az1
##   - e2e-az2
##
values: []

</pre>
</td>
			<td>Node affinity preset.<br> Allowed values: soft, hard.<br> ref: <a href="https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity">[link]</a></td>
		</tr>
		<tr>
			<td>nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>The nodeSelector on Pods tells Kubernetes to schedule Pods on the nodes with matching labels.<br> ref: <a href="https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/">[link]</a></td>
		</tr>
		<tr>
			<td>persistence.accessMode</td>
			<td>string</td>
			<td><pre lang="json">
"ReadWriteOnce"
</pre>
</td>
			<td>Set accessMode for pvc.</td>
		</tr>
		<tr>
			<td>persistence.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable persistence using Persistent Volume Claims.<br> ref: <a href="https://kubernetes.io/docs/user-guide/persistent-volumes/">[link]</a></td>
		</tr>
		<tr>
			<td>persistence.existingClaim</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>If you want to reuse an existing claim, you can pass the name of the PVC using  the existingClaim variable.</td>
		</tr>
		<tr>
			<td>persistence.mountPath</td>
			<td>string</td>
			<td><pre lang="json">
"/data"
</pre>
</td>
			<td>Set mountPath for pvc.</td>
		</tr>
		<tr>
			<td>persistence.size</td>
			<td>string</td>
			<td><pre lang="json">
"10Gi"
</pre>
</td>
			<td>Set size for pvc.</td>
		</tr>
		<tr>
			<td>persistence.storageClass</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Application data Persistent Volume Storage Class.<br> If defined, storageClassName: <storageClass><br> If set to "-", storageClassName: "", which disables dynamic provisioning<br> If undefined (the default) or set to null, no storageClassName spec is set,<br> choosing the default provisioner. (gp2 on AWS, standard on GKE, AWS & OpenStack)</td>
		</tr>
		<tr>
			<td>podAffinityPreset</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Pod affinity preset.<br> Allowed values: soft, hard.<br> ref: <a href="https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity">[link]</a></td>
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
			<td>Pod anti-affinity preset.<br> Allowed values: soft, hard.<br> ref: <a href="https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity">[link]</a></td>
		</tr>
		<tr>
			<td>podDisruptionBudget</td>
			<td>object</td>
			<td><pre lang="yaml">
enabled: false
minAvailable: 1
# maxUnavailable: 1

</pre>
</td>
			<td>PodDisruptionBudget configuration.</td>
		</tr>
		<tr>
			<td>podLabels</td>
			<td>object</td>
			<td><pre lang="yaml">
public-access: allow

</pre>
</td>
			<td>Extra labels to add to Pod.</td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="yaml">
enabled: true
fsGroup: 1000
runAsUser: 1000
runAsGroup: 1000
runAsNonRoot: true

</pre>
</td>
			<td>Pod securityContext.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod">[link]</a></td>
		</tr>
		<tr>
			<td>priorityClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Add priorityClassName<br> ref: <a href="https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass">[link]</a></td>
		</tr>
		<tr>
			<td>readinessProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Configure options for readiness probes.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes">[link]</a></td>
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
			<td>readinessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/smartcontrol/SmartControl/Login.jsp"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.httpGet.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readinessProbe.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td></td>
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
30
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
			<td>Specfies the required replicas.<br> Unset when using hpa.</td>
		</tr>
		<tr>
			<td>resources</td>
			<td>object</td>
			<td><pre lang="yaml">
limits:
    cpu: 2
    memory: 4Gi
requests:
    cpu: 0.5
    memory: 3Gi

</pre>
</td>
			<td>Set resources for the Pod.
We usually recommend not to specify default resources and to leave this as a conscious
choice for the user. This also increases chances charts run on environments with little
resources, such as Minikube. If you do want to specify resources, uncomment the following
lines, adjust them as necessary, and remove the curly braces after 'resources:'.

<details>
<summary>+Expand</summary>

```yaml
resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
```
</details></td>
		</tr>
		<tr>
			<td>secrets</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Populate secrets for the application.

<details>
<summary>+Expand</summary>

```yaml
secrets:
  db:
    stringData:
      DB_USER: '{{ .Values.dbUser }}'
      DB_PASSWORD: '{{ .Values.dbPassword }}'
  b64:
    data:
      DB_HOST: base64-encoded-value
```
The above example will create two secrets db and b64
(prefixed with {{ template "app.fullname" $ }}-).
</details></td>
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
			<td>Specify the default service port and targetPort.<br> Note: port or ports must be provided to enable service!<br></td>
		</tr>
		<tr>
			<td>service.ports</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Expose additional ports.
<details>
<summary>+Expand</summary>

```yaml
ports:
- name: http
  port: 80
  targetPort: http
- name: http
  port: 8080
```
</details></td>
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
			<td>Kubernetes service type and port number.</td>
		</tr>
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations to add to the service account.</td>
		</tr>
		<tr>
			<td>serviceAccount.automountServiceAccountToken</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Controls whether the container automatically mounts the ServiceAccount's API credentials.<br> In the serviceaccount/v1 this defaults to true, so also in this helm chart. recommended: false.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#opt-out-of-api-credential-automounting">[link]</a></td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Specifies whether a service account should be created.</td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The name of the service account to use.<br> If not set and create is true, a name is generated using the fullname template</td>
		</tr>
		<tr>
			<td>sidecar</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Add a simple sidecar to this deployment.
<details>
<summary>+Expand</summary>

```yaml
sidecar:
 name: netshoot
 repository: nicolaka/netshoot
 tag: latest
 args:
 - sleep
 - '999'
 containerSecurityContext:
  enabled: false
   runAsNonRoot: false
   allowPrivilegeEscalation: true
   capabilities:
     add:
     - NET_ADMIN
     - NET_RAW
```
</details></td>
		</tr>
		<tr>
			<td>startupProbe.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Configure options for startup probe.<br> ref: <a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes">[link]</a></td>
		</tr>
		<tr>
			<td>startupProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
15
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/smartcontrol/SmartControl/Login.jsp"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.httpGet.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.httpGet.scheme</td>
			<td>string</td>
			<td><pre lang="json">
"HTTP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>startupProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
20
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
			<td>Sync objects from Azure keyvault to Kubernetes as secrets or certificates.

<details>
<summary>+Expand</summary>

```yaml
sync-1:
 vaultname: azurekeyvaltname # name of the azure keyvault
 objectname: test-secret # secretname stored in AKV
 objecttype: secret # objecttype in AKV
 output:
   transform: # optional transformers executed in listed order
   - trim # optional - trims empty space
   - base64encode # optional - encode to base64
   - base64decode # optional - decode from base64
   secret:
     name: testsecret # secretname to create in kubernetes or use '{{ include "app.fullname" . }}' as value
     dataKey: TEST_SECRET #key to store in secret

```
The above example will create 1 secret in Kubernetes from Azure keyvault
Supported vault object types: secret, certificate, key, multi-key-value-secret
</details></td>
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
			<td><pre lang="yaml">
[]
</pre>
</td>
			<td>A list of Kubernetes Tolerations, if required.<br>

<details>
<summary>+Expand</summary>

```yaml
tolerations:
  - key: foo.bar.com/role
    operator: Equal
    value: master
    effect: NoSchedule
```
</details>
ref: <a href="https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#toleration-v1-core">[link]</a></td>
		</tr>
		<tr>
			<td>topologySpreadConstraints</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>A list of Kubernetes TopologySpreadConstraints, if required.<br> ref: <a href="https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#topologyspreadconstraint-v1-core">[link]</a></td>
		</tr>
		<tr>
			<td>updateStrategy</td>
			<td>object</td>
			<td><pre lang="yaml">
type: RollingUpdate

</pre>
</td>
			<td>Set up update strategy for installation. Set to Recreate if you use persistent volume that cannot be mounted by more than one pods to makesure the pods are destroyed first.
<details>
<summary>+Expand</summary>

```yaml
updateStrategy:
 type: RollingUpdate
 rollingUpdate:
   maxSurge: 25%
   maxUnavailable: 25%
```
</details>
ref: <a href="https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy">[link]</a></td>
		</tr>
		<tr>
			<td>volumeMounts</td>
			<td>list</td>
			<td><pre lang="yaml">
- mountPath: /usr/local/tomcat/license
  name: license-volume
- mountPath: /tmp
  name: tmpfs-1

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
			<td>volumes</td>
			<td>list</td>
			<td><pre lang="yaml">
- name: license-volume
  secret:
    secretName: '{{ include "app.fullname" . }}'
    items:
        - key: sd_gem_den_haag_haven.license
          path: sd_gem_den_haag_haven.license
- name: tmpfs-1
  emptyDir: {}

</pre>
</td>
			<td>Array to add volumes.

<details>
<summary>+Expand</summary>

```yaml
- name: storage
  persistentVolumeClaim:
    claimName: claimName
```
</details>
ref: <a href="https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/volume/#Volume">[link]</a></td>
		</tr>
	</tbody>
</table>



> **Tip**: You can use the default [values.yaml](values.yaml)


----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)