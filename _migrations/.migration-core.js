const { prompt } = require('inquirer')
const { red, green } = require('chalk')
const { createPatch, diffLines } = require('diff')

const { existsSync, readFileSync, writeFileSync } = require('fs')
const { dirname, resolve } = require('path')

const exit = (str, code = 0) => {
  console.log(str)
  process.exit(code)
}

const root = (dir) => {
  if (dirname(dir) === dir) exit('Can\'t find root of project.', 1)

  return existsSync(`${dir}/package.json`)
    ? dir
    : root(dirname(dir))
}

const readProjectFileSync = (path) => {
  const fullpath = resolve(root(process.cwd()) + '/' + path)

  if (!existsSync(fullpath)) exit(`Can't find project file ${fullpath}.`, 1)

  return readFileSync(fullpath, 'utf-8')
}

const patch = (path, patches) => {
  const fullpath = resolve(root(process.cwd()) + '/' + path)
  const oldString = readProjectFileSync(path)
  const newString = patches
    .reduce((acc, [from, to]) => acc.replace(from, to), oldString)


  const diff = diffLines(oldString, newString)
  if (!diff.some(({ added, removed }) => added || removed)) exit(`Nothing to patch`)

  const patchString = createPatch(fullpath, oldString, newString)
    .replace(/\n-(.*)/g, red('\n-$1'))
    .replace(/\n\+(.*)/g, green('\n+$1'))

  console.log(patchString)
  prompt([
    {
      name: 'apply',
      default: 'Y',
      message: 'Would you like to apply this patch?',
      type: 'confirm'
    }
  ]).then(({ apply }) => {
    if (!apply) return
    writeFileSync(fullpath, newString)
    exit('Patch applied!')
  })
}

module.exports = { root, readProjectFileSync, patch }
