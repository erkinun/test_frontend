const { patch } = require('./.migration-core')

patch(
  'src/server.js',
  [
    [/routes.forEach\(\({0,1}route\){0,1}/g, 'routes.forEach(({ path })'],
    [/coreRouter.get\(route.path/g, 'coreRouter.get(path'],
    [
      'coreRouter.get(\'*\', ctx => (ctx.status = 404))\ncoreRouter.prefix(prefix())',
      'coreRouter.prefix(prefix())'
    ],
    [
      /coreRouter.prefix\(prefix\(\)\)/,
      'coreRouter.get(\'*\', ctx => (ctx.status = 404))\ncoreRouter.prefix(prefix())'
    ]
  ]
)
