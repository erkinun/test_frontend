---
to: package.json
---
{
  "name": "<%= app %>",
  "version": "0.1.0",
  "license": "MIT",
  "scripts": {
    "--------------- TESTING": "-----------------------",
    "lint": "eslint src",
    "test": "jest",
    "test:jest": "jest",
    "--------------- RUNNING": "-----------------------",
    "start": "razzle start",
    "start:prod": "node build/server.js",
    "--------------- BUILDING": "----------------------",
    "build": "razzle build"
  },
  "dependencies": {
    "@uswitch/koa-core": "^1.9.2",
    "@sentry/node": "^5.5.0",
    "@uswitch/ustyle-react": "0.0.89",
    "@loadable/component": "^5.10.2",
    "@loadable/server": "^5.10.2",
    "hygen": "^1.5.8",
    "graphql-tag": "^2.10.1",
    "graphql": "^14.4.2",
    "lazysizes": "^4.1.7",
    "react-imgix": "^8.6.3",
    "node-sass": "^4.12.0",
    "razzle": "^3.0.0",
    "react": "^16.8.6",
    "react-dom": "^16.8.6",
    "react-helmet-async": "1.0.2",
    "react-router-dom": "^5.0.1",
    "core-js": "3.1.4",
    <% if (!locals.template || locals.template === 'redux') { -%>
    "axios": "^0.19.0",
    <% if (locals.http === 'axios+cache') { -%>
    "axios-cache-adapter": "^2.3.3",
    <% } -%>
    "react-redux": "^7.0.1",
    "redux": "^4.0.1",
    "redux-devtools-extension": "^2.13.2",
    "redux-thunk": "^2.2.0",
    <% } -%>
    <% if (locals.template === 'apollo' || !locals.http || (locals.http !== 'axios' && locals.http !== 'axios+cache')) { -%>
    "node-fetch": "^2.3.0",
    <% } -%>
    <% if (locals.template === 'apollo') { -%>
    "node-cache": "^4.2.0",
    "unfetch": "^4.0.1",
    "apollo-cache-inmemory": "^1.6.2",
    "apollo-client": "^2.6.3",
    "apollo-link": "^1.2.12",
    "apollo-link-error": "^1.1.11",
    "apollo-link-http": "^1.5.15",
    "apollo-link-batch-http": "^1.2.12",
    "apollo-link-state": "^0.4.2",
    "react-apollo": "^2.5.8",
    <% } -%>
    "ustyle": "^1.19.2"
  },
  "devDependencies": {
    "@babel/plugin-syntax-dynamic-import": "^7.2.0",
    "@loadable/babel-plugin": "^5.10.0",
    "@loadable/webpack-plugin": "^5.7.1",
    "acorn": "^6.1.1",
    "acorn-dynamic-import": "^4.0.0",
    "babel-eslint": "^10.0.3",
    "babel-plugin-transform-imports": "^1.5.1",
    "cssnano": "^3.10.0",
    "ejs-compiled-loader": "^1.1.0",
    "eslint": "^4.19.1",
    "eslint-config-react-app": "^4.0.1",
    "eslint-config-standard": "^10.2.1",
    "eslint-config-standard-jsx": "^5.0.0",
    "eslint-plugin-flowtype": "^4.3.0",
    "eslint-plugin-import": "^2.8.0",
    "eslint-plugin-jest": "^21.2.0",
    "eslint-plugin-jsx-a11y": "^6.2.3",
    "eslint-plugin-node": "^5.2.1",
    "eslint-plugin-promise": "^3.6.0",
    "eslint-plugin-react": "^7.7.0",
    "eslint-plugin-react-hooks": "^2.2.0",
    "eslint-plugin-standard": "^3.0.1",
    "raw-loader": "^0.5.1",
    "sass-loader": "^6.0.6",
    "stylelint": "^8.4.0",
    "stylelint-config-recommended": "^1.0.0",
    "stylelint-config-recommended-scss": "^3.1.0",
    "stylelint-scss": "^2.4.0",
    "webpack": "^4.30.0",
    "webpack-bundle-analyzer": "^2.13.1",
    "chalk": "^2.4.2",
    "cheerio": "^1.0.0-rc.2"
  }
}
