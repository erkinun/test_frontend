---
to: __config__/env.json
inject: true
after: '{'
skip_if: '"sentryDSN": "'
---
  "sentryDSN": "<%= dsn %>",