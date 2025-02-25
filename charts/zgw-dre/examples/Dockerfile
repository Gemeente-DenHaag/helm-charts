ARG CAMUNDA_VERSION=7.22.0

FROM camunda/camunda-bpm-platform:run-${CAMUNDA_VERSION}

RUN mkdir -p /camunda/configuration/userlib

# Camunda Keycloak Extension
RUN wget https://artifacts.camunda.com/artifactory/camunda-bpm-community-extensions/org/camunda/bpm/extension/camunda-platform-7-keycloak-run/${CAMUNDA_VERSION}/camunda-platform-7-keycloak-run-${CAMUNDA_VERSION}.jar -P /camunda/configuration/userlib

RUN ls -l /camunda/configuration/userlib

RUN rm -f /camunda/configuration/default.yml
RUN rm -f /camunda/configuration/deployment.yml
RUN chown -R camunda:camunda /camunda/configuration/userlib
