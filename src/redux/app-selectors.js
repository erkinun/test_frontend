const app = (s = {}) => s.app || {}
export const env = (s = {}) => app(s).env || 'development'
