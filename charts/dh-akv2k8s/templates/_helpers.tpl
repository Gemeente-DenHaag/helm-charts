{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper App image name
The image.fullImage property can be set from a pipeline
*/}}
{{- define "app.image" -}}
{{- if .Values.image.fullImage -}}
  {{ include "common.tplvalues.render" (dict "value" .Values.image.fullImage "context" $) }}
{{- else -}}
  {{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "app.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Set App PVC
*/}}
{{- define "app.pvc" -}}
{{- .Values.persistence.existingClaim | default (include "common.names.fullname" .) -}}
{{- end -}}

{{/*
Return  the proper Storage Class
*/}}
{{- define "app.storageClass" -}}
{{- include "common.storage.class" (dict "persistence" .Values.persistence "global" .Values.global) -}}
{{- end -}}

{{/*
Choose port name based on .port .targetPort. Fallbacks to "app".

Examples:
  {{- include "app.service.defaultPortName" (dict "port" "80" "targetPort" "8080") }}
  {{- include "app.service.defaultPortName" (dict "port" "80" "targetPort" "api") }}
*/}}
{{- define "app.service.defaultPortName" -}}
{{- $targetPort := .targetPort | default .port -}}
{{- if regexMatch "^[0-9]+$" ($targetPort | toString) -}}
app
{{- else -}}
{{ $targetPort }}
{{- end -}}
{{- end -}}

{{/*
Set the tls secret
*/}}
{{- define "app.ingress.tlssecret" -}}
{{- if .Values.ingress.existingTlsSecret -}}
    {{ .Values.ingress.existingTlsSecret }}
{{- else -}}
    {{ printf "%s-tls" .Values.ingress.hostname }}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Horizontal Pod Autoscaler.
This is modified version of common.capabilities.hpa.apiVersion. context has been removed
*/}}
{{- define "app.hpa.apiVersion" -}}
{{- if semverCompare "<1.23-0" (include "common.capabilities.kubeVersion" .) -}}
{{- if .beta2 -}}
{{- print "autoscaling/v2beta2" -}}
{{- else -}}
{{- print "autoscaling/v2beta1" -}}
{{- end -}}
{{- else -}}
{{- print "autoscaling/v2" -}}
{{- end -}}
{{- end -}}

{{/*
Dump a variable to json for debugging purposes and fail
Example:
  {{- template "app.var_dump" $myVar }}
*/}}
{{- define "app.var_dump" -}}
{{- . | mustToPrettyJson | printf "\nThe JSON output of the dumped var is: \n%s" | fail }}
{{- end -}}