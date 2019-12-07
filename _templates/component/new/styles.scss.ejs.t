---
to: src/components/<%= h.kebabCase(name) %>/<%= h.kebabCase(name) %>.scss
---
<%
importName = h.kebabCase(name)
componentName = h.capitalise(h.camelCase(name))
className = h.camelCase(name).toLowerCase()
-%>
.<%= className %> {
  display: block;
}
