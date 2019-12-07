---
to: __kube__/deployment.yaml
---
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
  namespace: <%= team %>
spec:
  replicas: {{ .Env.replicas }}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0%
      maxSurge: 25%
  selector:
    matchLabels:
      app: <%= app %>
      environment: {{ .Env.DRONE_DEPLOY_TO }}
      team: <%= team %>
  template:
    metadata:
      labels:
        app: <%= app %>
        environment: {{ .Env.DRONE_DEPLOY_TO }}
        team: <%= team %>
      annotations:
        prometheus.io.scrape: "true"
        prometheus.io.path: "/metrics"
        prometheus.io.port: "3050"
    spec:
      containers:
      - image: 'registry.usw.co/uswitch/<%= app %>:{{ printf "%.8s" .Env.DRONE_COMMIT }}'
        name: server
        ports:
          - name: app-port
            containerPort: 3000
          - name: meta-port
            containerPort: 3050
        resources:
          requests:
            memory: 256Mi
            cpu: 0.5
          limits:
            memory: 1024Mi
        env:
          - name: RAZZLE_NODE_ENV
            value: {{ .Env.DRONE_DEPLOY_TO }}
          - name: NODE_ENV
            value: {{ .Env.DRONE_DEPLOY_TO }}
        readinessProbe:
          initialDelaySeconds: 30
          httpGet:
            port: meta-port
            path: /status
