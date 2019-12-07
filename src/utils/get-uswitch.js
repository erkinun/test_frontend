import getWindow from './get-window'

export default (prop) => getWindow.uSwitch
  ? getWindow().uSwitch[prop]
  : {}
