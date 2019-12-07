import cheerio from 'cheerio'
import chalk from 'chalk'

const SEOStopSign = `
                                SEO WARNINGS

                            uuuuuuuuuuuuuuuuuuuu
                          u" uuuuuuuuuuuuuuuuuu "u
                        u" u$$$$$$$$$$$$$$$$$$$$u "u
                      u" u$$$$$$$$$$$$$$$$$$$$$$$$u "u
                    u" u$$$$$$$$$$$$$$$$$$$$$$$$$$$$u "u
                  u" u$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$u "u
                u" u$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$u "u
                $ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $
                $ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $
                $ $$$" ... "$...  ...$" ... "$$$  ... "$$$ $
                $ $$$u '"$$$$$$$  $$$  $$$$$  $$  $$$  $$$ $
                $ $$$$$$uu "$$$$  $$$  $$$$$  $$  """ u$$$ $
                $ $$$""$$$  $$$$  $$$u "$$$" u$$  $$$$$$$$ $
                $ $$$$....,$$$$$..$$$$$....,$$$$..$$$$$$$$ $
                $ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $
                "u "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" u"
                  "u "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" u"
                    "u "$$$$$$$$$$$$$$$$$$$$$$$$$$$$" u"
                      "u "$$$$$$$$$$$$$$$$$$$$$$$$" u"
                        "u "$$$$$$$$$$$$$$$$$$$$" u"
                          "u """""""""""""""""" u"
                            """""""""""""""""""""
`

const replicateString = (character, num) => Array.apply(null, Array(num)).map(_ => character)

const fillLineWith = (character, num) => replicateString(character, num).join('')

const SEOWarning = (messages) => {
  const PADDING = 10
  const padding = fillLineWith(' ', PADDING)
  const longestLine = Math.max(...messages.map(x => x.length + 2))
  const border = fillLineWith('=', longestLine + 2)

  const ms = messages.reduce((acc, curr) => {
    const SIDE_PADDING = Math.abs(((curr.length + 2) - longestLine) / 2)
    const sidePadding = fillLineWith(' ', SIDE_PADDING)
    return acc.concat(` ${sidePadding}${curr}${sidePadding} `)
  }, []).join('\n' + padding)

  return `
${padding}${border}
${padding} ${ms}
${padding}${border}
`
}

const logSEOWarnings = (warnings) => console.log(chalk.bold.red(`${SEOStopSign}${SEOWarning(warnings)}`))

const oneMetadecriptionAndTitleTag = ($) => ($('meta[name="description"]').length === 0 || $('head > title').length === 0)
const oneH1Tag = ($) => $('h1').length > 1
// ^ = xor, because no canonical when there is a noindex robot set
const noCannonical = ($) => ($('link[rel="canonical"]').length === 0 ^ $('meta[name="robots"]').attr('content') === 'noindex')
const noH1Tag = ($) => $('h1').length === 0

const checks = ($) => ([
  oneH1Tag($) && { error: '<h1>USE H1 ONLY ONCE</h1>' },
  oneMetadecriptionAndTitleTag($) && { error: '<h1>ADD A TITLE AND A META TAG!!</h1>' },
  noCannonical($) && { warning: 'There is no canonical link set' },
  noH1Tag($) && { warning: 'You need to add one H1 tag on the page to be SEO compliant' }
])

const safeConcat = (array, concattable) =>
  concattable ? array.concat(concattable) : array

const SEOChecker = async (ctx, next) => {
  await next()

  if (ctx.type !== 'text/html' || ctx.response.status !== 200) return

  const alerts = checks(cheerio.load(ctx.response.body)).reduce((acc, curr) => ({
    errors: safeConcat(acc.errors, curr.error),
    warnings: safeConcat(acc.warnings, curr.warning)
  }), { errors: [], warnings: [] })

  if (alerts.errors.length) {
    ctx.status = 500
    ctx.body = alerts.errors.join('<br />')
    return
  }

  if (alerts.warnings.length) {
    logSEOWarnings(alerts.warnings)
  }
}

export default SEOChecker
