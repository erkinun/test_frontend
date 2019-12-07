---
to: "<%= (locals.template === 'apollo') ? 'src/apollo/client.js' : null %>"
---
import { ApolloClient } from 'apollo-client'
import { ApolloLink } from 'apollo-link'
import { onError } from 'apollo-link-error'
import { BatchHttpLink } from 'apollo-link-batch-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
/* import introspectionQueryResultData from '../../__config__/fragment-types.json' */
import { withClientState } from 'apollo-link-state'
import { omit } from '../utils/obj'

/* fragmentMatching: Add this in if you want to use fragment matching
const fragmentMatcher = new IntrospectionFragmentMatcher({
  introspectionQueryResultData
})
*/

const makeClient = ({ isServer, uri, fetch, headers, cachingWrapper = (x) => x }) => {
  const inMemoryCache = new InMemoryCache(/* { fragmentMatcher } */)
  const cache = isServer ? inMemoryCache : inMemoryCache.restore(window.__initialState__)

  const stateLink = withClientState({
    cache
  })

  const errorLink = onError(({ graphQLErrors, networkError }) => {
    if (graphQLErrors) {
      graphQLErrors.map(({ message, locations, path }) =>
        console.log(
          `[GraphQL error]: Message: ${message}, Location: ${JSON.stringify(locations)}, Path: ${JSON.stringify(path)}`
        )
      )
    }
    if (networkError) console.log(`[Network error]: ${networkError}`)
  })

  const batchOptions = { uri, credentials: 'include', fetch }
  const batchApiHttpLink = new BatchHttpLink(headers ? {...batchOptions, ...omit(['host'], headers)} : batchOptions)

  const cacheWrappedLink = cachingWrapper(batchApiHttpLink)

  return new ApolloClient({
    ssrMode: isServer,
    fetch,
    link: ApolloLink.from([
      errorLink,
      stateLink,
      cacheWrappedLink
    ]),
    cache
  })
}

export { makeClient }
