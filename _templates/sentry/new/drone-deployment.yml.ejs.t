---
to: .drone.yml
inject: true
append: true
skip_if: 'notify-sentry-deployment:'
---

  notify-sentry-deployment:
    when:
      event: deployment
    image: getsentry/sentry-cli:1.35
    secrets: [ SENTRY_AUTH_TOKEN ]
    commands:
      - sentry-cli releases -o uswitchcom -p <%= app %> finalize <%= app %>-${DRONE_COMMIT_SHA:0:8}
      - sentry-cli releases -o uswitchcom -p <%= app %> deploys <%= app %>-${DRONE_COMMIT_SHA:0:8} new -e ${DRONE_DEPLOY_TO}