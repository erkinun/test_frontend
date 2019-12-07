const env = process.env.RAZZLE_NODE_ENV || process.env.NODE_ENV || 'development'
export const release = process.env.RAZZLE_RELEASE || require('../../../package.json').version

export const isDev = env === 'development'
export const isProd = env === 'production'

export const environment = env

export default env
