import React from 'react'
import { Helmet } from 'react-helmet-async'

import '../styles/main.scss'

export default () =>
  <div>
    <Helmet>
      <title>Default app</title>
      <meta name='description' content='default meta' />
    </Helmet>
  </div>
