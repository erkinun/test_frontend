export default (type, asyncF, ...data) => async (dispatch) => {
  dispatch({ type: type, payload: data })
  try {
    const result = await asyncF(...data)
    dispatch({ type: type + '_SUCCESS', payload: result.data })
  } catch (ex) {
    dispatch({ type: type + '_FAILURE', payload: { ...ex.response } })
  }
}
