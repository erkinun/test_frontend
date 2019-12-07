export const pick = (arr, obj) => arr
  .reduce((acc, it) => it in obj ? { ...acc, [it]: obj[it] } : acc, {})

export const omit = (arr, obj) => Object
  .entries(obj)
  .filter(([a, b]) => !arr.includes(a))
  .reduce((acc, [key, val]) => ({ ...acc, [key]: val }), {})
