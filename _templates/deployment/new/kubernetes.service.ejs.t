---
to: __kube__/service.yaml
---
---
apiVersion: v1
kind: Service
metadata:
  name: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
  namespace: <%= team %>
spec:
  ports:
  - name: app-port
    port: 80
    targetPort: 3000
    protocol: TCP
  - name: meta-port
    port: 81
    targetPort: 3050
    protocol: TCP
  selector:
    app: <%= app %>
    environment: {{ .Env.DRONE_DEPLOY_TO }}
    team: <%= team %>
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
  namespace: <%= team %>
  annotations:
    ingress.kubernetes.io/configuration-snippet: gzip off;
    ingress.kubernetes.io/force-ssl-redirect: "true"
    com.uswitch.heimdall/5xx-rate: "0.01"
<% if (locals.multiCluster) { -%>
    yggdrasil.uswitch.com/healthcheck-path: /status
    kubernetes.io/ingress.class: multi-cluster
<% } else { %>
    kubernetes.io/ingress.class: internal
<% } -%>
spec:
  rules:
  - host: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}.internal.usw.co
    http:
      paths:
      - path: /status
        backend:
          serviceName: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
          servicePort: meta-port
      - path: /
        backend:
          serviceName: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
          servicePort: app-port
