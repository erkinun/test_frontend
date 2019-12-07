---
inject: true
to: .drone.yml
append: true
skip_if: build-backstopjs-container
---

  build-backstopjs-container:
    when:
      event: deployment
      environment: staging
    image: plugins/docker
    repo: registry.usw.co/uswitch/banking-credit-cards-web-uf
    dockerfile: __backstop__/Dockerfile
    tags:
      - backstopjs

  visual-regression-test:
    when:
      event: deployment
      environment: staging
    image: registry.usw.co/uswitch/banking-credit-cards-web-uf:backstopjs
    secrets: [ AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID ]
    commands:
      - ./__backstop__/visual_regression_test.sh