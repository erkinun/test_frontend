---
to: src/components/<%= h.kebabCase(name) %>/<%= h.kebabCase(name) %>.spec.jsx
---
<%
importName = h.kebabCase(name)
componentName = h.capitalise(h.camelCase(name))
className = h.camelCase(name).toLowerCase()
-%>
import React from 'react'
import { shallow } from 'enzyme'

import <%= componentName %> from './<%= importName %>.jsx'

describe(`<%= componentName %>`, () => {
  it(`should have the right CSS name`, () => {
    const result = shallow(<<%= componentName %> />)
    expect(result.hasClass('<%= className %>')).toBe(true)
  })

  it(`should have the right children`, () => {
    const result = shallow(<<%= componentName %> />) 
    expect(result.contains('Hello, world!')).toBe(true)
  })
})