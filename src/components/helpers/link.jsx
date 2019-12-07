import React from 'react'
import { Link } from 'react-router-dom'

import getPathPrefix from '../../utils/get-path-prefix'
import getWindow from '../../utils/get-window'

export default ({ className, disabled, to, style, children }) => {
  if (disabled) return children

  const pathname = `${getPathPrefix()}${to}`
  const toParams = typeof to === 'string'
    ? { ...getWindow().location, pathname }
    : { ...to, pathname }

  return (
    <Link
      to={toParams}
      className={className}
      style={style}
    >
      { children }
    </Link>
  )
}
