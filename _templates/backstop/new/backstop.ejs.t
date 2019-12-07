---
to: backstop.json
---
{
  "id": "backstop_default",
  "viewports": [
    {
      "label": "mobile",
      "width": 480,
      "height": 480
    },
    {
      "label": "small-tablet",
      "width": 600,
      "height": 768
    },
    {
      "label": "tablet",
      "width": 768,
      "height": 768
    },
    {
      "label": "desktop",
      "width": 992,
      "height": 768
    },
    {
      "label": "large-desktop",
      "width": 1200,
      "height": 768
    },
    {
      "label": "extra-large-desktop",
      "width": 1600,
      "height": 1400
    }
  ],
  "scenarios": [
    {
      "label": "Your scenario label",
      "referenceUrl": "https://<%= app %>-production.internal.usw.co",
      "url": "https://<%= app %>-staging.internal.usw.co"
    }
  ],
  "paths": {
    "bitmaps_test": "backstop_data/bitmaps_test",
    "engine_scripts": "/tmp/backstop_data/engine_scripts",
    "html_report": "/tmp/backstop_data/html_report",
    "ci_report": "/tmp/backstop_data/ci_report"
  },
  "report": [],
  "engine": "puppeteer",
  "engineOptions": {
    "args": ["--no-sandbox"]
  },
  "asyncCaptureLimit": 5,
  "asyncCompareLimit": 50,
  "debug": false,
  "debugWindow": false
}
