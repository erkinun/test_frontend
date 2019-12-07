---
to: __config__/env.json
---
{
  "appName": "<%= app %>",
  "pathPrefix": {
    "production": "<%= locals.appPath || '/' %>"
  }
}
