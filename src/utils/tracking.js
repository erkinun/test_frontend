import getWindow from './get-window'
import { appName } from '../../__config__/env.json'

export const track = (action, label, value, callback, nonInteractive) => getWindow().uSwitchEventTracking
  ? getWindow().uSwitchEventTracking(appName, action, label, value, callback, nonInteractive)
  : console.log('gaEvent', { type: appName, action, label, value, callback, nonInteractive })
