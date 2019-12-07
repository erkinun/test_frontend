const defaultWindow = {}

export default () => typeof window === 'undefined' ? defaultWindow : window
