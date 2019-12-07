import { pick } from '../../utils/obj'

export const accessLog = ({ cookie = {}, state = {} }) => ({
  ...pick([ 'id', 'errors', 'errorsCount', 'trace' ], state),
  ...pick([ 'usca', 'uscc', 'usci' ], cookie)
})

export default accessLog
