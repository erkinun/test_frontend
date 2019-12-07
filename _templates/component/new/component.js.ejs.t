---
to: src/components/<%= h.kebabCase(name) %>/<%= h.kebabCase(name) %>.jsx
---
<%
importName = h.kebabCase(name)
componentName = h.capitalise(h.camelCase(name))
className = h.camelCase(name).toLowerCase()
-%>
import './<%= importName %>.scss'
<% if (locals.hasOwnProperty('connect')) { -%>
import React, { PureComponent } from 'react'
import { connect } from 'react-redux'

class <%= componentName %> extends PureComponent {
  constructor (props) {
    super(props)
    this.state = <%= locals.defaultState || '{ }' %>
  }

  render () {
    return (
      <div className='<%= className %>'>
        Hello, world!
      </div>
    )
  }
}

export default connect(s => ({}), {})(<%= componentName %>)
<% } else { -%>
import React from 'react'

const <%= componentName %> = (props) => (
  <div className='<%= className %>'>
    Hello, world!
  </div>
)

export default <%= componentName %>
<% } -%>
