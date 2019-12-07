---
to: package.json
inject: true
before: dependencies
skip_if: jest.*{
---
  "jest": {
    "setupTestFrameworkScriptFile": "<rootDir>/.jest.config.js",
    "moduleNameMapper": {
      "\\.s?css$": "identity-obj-proxy"
    }
  },
