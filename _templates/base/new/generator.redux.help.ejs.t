---
to: "<%= (!locals.template || locals.template === 'redux') ? '_templates/redux/help/index.ejs.t' : null %>"
---
---
message: |
  - hygen redux {bold {greenBright new}} [<flags>]
  
  Creates a set of {bold selectors}, {bold actions} and a {bold reducer}
  for the redux pattern

  Flags:
    --{bold name}: The name of the reducer
    --defaultState: The default state to return, e.g. '[]' or '"string"'
---
