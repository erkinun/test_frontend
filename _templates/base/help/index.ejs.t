---
message: |
  Generates the base scaffold for the application

  - hygen base {bold {greenBright new}} [<flags>]
  - {bold bold} says this is required

  Flags:
    --{bold app}: your app name
    --{bold team}: the team and kube namespace
    --appPath: the path to serve the site on production
    --template: [apollo, redux=default] the base state template you want to use in your app
    --test: [bool] run this if you are running this within the `uf` project
---