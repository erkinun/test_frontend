import { traceFetch } from '../koa/zipkin'
const headers = { 'Content-Type': 'text/html' }

const blockMatcher = /<!--\s?#\s?block\s+name="(\w+)"\s*-->(.*?)<!--\s?#\s+endblock\s*-->/
const includeMatcher = /<!--\s?#\s?include\s+(?:virtual|file)="([^"]+)"(?:\s+stub="(\w+)")?\s*-->/
const cachedLocations = {}

const getContent = async (ctx, location) => {
  const [, base] = Object
    .entries(ctx)
    .find(([ key ]) => location.match(key)) || []

  if (!base) return
  if (cachedLocations[location]) return cachedLocations[location]
  try {
    const res = await traceFetch({remote: 'includes'}, `${base}${location}`, { headers })
    const html = res.text()
    cachedLocations[location] = html
    return html
  } catch (e) { }
}

const extractBlock = (part) => {
  const [, name, content] = part.match(blockMatcher) || []
  return { [name]: content }
}

const processInclude = async (ctx, part, blocks) => {
  if (!part.match(includeMatcher)) return Promise.resolve(part)

  const [, location, stub] = part.match(includeMatcher)
  const data = await getContent(ctx, location)

  const result = data || blocks[stub]
  return result
}

export const compile = async (ctx, content) => {
  if (typeof content !== 'string') return content

  const lines = content
    .split('\n')
    .map(it => it.trim())

  const blocks = lines.reduce((acc, it) => ({ ...acc, ...extractBlock(it) }), {})
  const processed = await Promise.all(
    lines.map(it => processInclude(ctx, it, blocks))
  )

  return processed.join('\n')
}
