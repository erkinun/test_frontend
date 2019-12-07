import React, { Component } from 'react'
import { isServer } from '../../server/helpers/env'

export default class DontHydrate extends Component {
  shouldComponentUpdate() {
    return false
  }
  render() {
    return isServer ? (
      <div className={this.props.className}>{this.props.children}</div>
    ) : (
      <div
        className={this.props.className}
        dangerouslySetInnerHTML={{ __html: '' }}
        suppressHydrationWarning
      />
    )
  }
}
