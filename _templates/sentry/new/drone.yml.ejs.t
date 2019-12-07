---
to: .drone.yml
inject: true
before: 'deployment:'
skip_if: 'sentry-sourcemaps:'
---
  sentry-sourcemaps:
    when:
      event: push
      branch: master
    image: getsentry/sentry-cli:1.35
    secrets: [ SENTRY_AUTH_TOKEN ]
    commands:
      - sentry-cli releases -o uswitchcom -p <%= app %> new <%= app %>-${DRONE_COMMIT_SHA:0:8}
      - sentry-cli releases -o uswitchcom -p <%= app %> files <%= app %>-${DRONE_COMMIT_SHA:0:8} upload-sourcemaps build --rewrite --url-prefix /opt/<%= app %>/build
