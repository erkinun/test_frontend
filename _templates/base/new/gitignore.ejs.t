---
to: "<%= !locals.test ? '.gitignore' : null %>"
---
logs
*.log
npm-debug.log*
.DS_Store

coverage
node_modules
build
.env.local
.env.development.local
.env.test.local
.env.production.local