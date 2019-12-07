---
to: .drone.yml
---
pipeline:
  build:
    when:
      event: push
    image: node:10.16-alpine
    commands:
      - apk add --no-cache --update git
      - rm -rf /var/cache/apk/*
      - npm ci
      - npm run build
      - npm prune --production
    environment:
      - RAZZLE_RELEASE=<%= app %>-${DRONE_COMMIT_SHA:0:8}
      - PUBLIC_PATH=https://assets0.uswitch.com/s3/uswitch-assets-eu/<%= app %>/

  assets:
    when:
      event: push
    image: python:3.6.2-alpine
    secrets: [ AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID ]
    commands:
      - apk add --no-cache make && rm -rf /var/cache/apk/*
      - pip install --upgrade awscli
      - aws s3 cp --region eu-west-1 --recursive build/public/ s3://uswitch-assets-eu/<%= app %>/ --cache-control "max-age=31536000, immutable" --acl=public-read

  docker:
    when:
      event: push
    image: plugins/docker
    repo: registry.usw.co/uswitch/<%= app %>
    dockerfile: Dockerfile
    build_args:
      - WORKDIR=/opt/<%= app %>
    tags:
      - latest
      - "${DRONE_COMMIT_SHA:0:8}"

  deploy-staging:
    when:
      event: deployment
      environment: staging
    image: registry.usw.co/drone/deployment:latest
    tag_prefix: ${DRONE_DEPLOY_TO}
    secrets: [ KUBE_CA, KUBE_TOKEN, KUBE_SERVER ]
    kubernetes:
      template: [__kube__/hpa.yaml, __kube__/service.yaml, __kube__/deployment.yaml]
      namespace: <%= team %>
    environment:
      replicas: "2"

  deploy-production:
    when:
      event: deployment
      environment: production
    image: registry.usw.co/drone/deployment:latest
    tag_prefix: ${DRONE_DEPLOY_TO}
    secrets: [ KUBE_CA, KUBE_TOKEN, KUBE_SERVER ]
    kubernetes:
      template: [__kube__/hpa.yaml, __kube__/service.yaml, __kube__/deployment.yaml]
      namespace: <%= team %>
<% if (locals.multiCluster) { -%>
      clusters:
        - red
        - black
        - blue
<% } -%>
    environment:
      replicas: "4"
