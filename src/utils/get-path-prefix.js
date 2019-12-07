import { pathPrefix } from '../../__config__/env.json'
export default () => pathPrefix[process.env.NODE_ENV] || ''
