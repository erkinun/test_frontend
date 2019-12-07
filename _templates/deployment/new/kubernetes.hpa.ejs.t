---
to: __kube__/hpa.yaml
---
---
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: <%= app %>
  namespace: <%= team %>
spec:
  maxReplicas: 20
  minReplicas: {{ .Env.replicas }}
  metrics:
    - type: Pods
      pods:
        metricName: koa_requests_per_second
        targetAverageValue: 5
  scaleTargetRef:
    apiVersion: extensions/v1beta1
    kind: Deployment
    name: <%= app %>-{{ .Env.DRONE_DEPLOY_TO }}
