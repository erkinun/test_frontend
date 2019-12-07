<h1 align="center"><i>uf</i></h1>
<p align="center">
  <i>
    A front-end react, koa and redux / apollo application scaffold for uSwitch
  </i>
</p>

<p align="center">
  <b><a href="#overview">Overview</a></b>
  |
  <b><a href="#getting-started">Getting started</a></b>
  |
  <b><a href="#quickstart">Quickstart</a></b>
  |
  <b><a href="#generating">Generating</a></b>
  |
  <b><a href="#running">Running</a></b>
  |
  <b><a href="#building">Building</a></b>
  |
  <b><a href="#deployment">Deployment</a></b>
  |
  <b><a href="#contributors">Contributors</a></b>
</p>

[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=for-the-badge&label=contributors)](#contributors)
![Type](https://img.shields.io/badge/🗲-app-ffc14e.svg?style=for-the-badge)
[![Language](https://img.shields.io/badge/❤-JS-e89d48.svg?style=for-the-badge)](https://github.com/jaredpalmer/razzle/)
[![Style](https://img.shields.io/badge/🎨-standard-e89d48.svg?style=for-the-badge)](https://standardjs.com/)
[![Language](https://img.shields.io/badge/-sass-e89d48.svg?style=for-the-badge&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAD0AAAAuCAYAAACbIBHcAAAFTUlEQVR4Ad3aA4xkyx7H8V7bvmvbtm3btm3btm3btm1zPKtB7%2FuepE%2FyT2V6XnP0Sz737h5UnWqUeg3Oyr9%2F%2F2KhArpjLnZhP45gN2ahB3IZQnNoQCoMxCn4wNK8wghECy0NjYDaOAh%2F2JN3KB2SGxsVPfEelsQfHviEz4G8QN4oGVIb%2B9GCd20hWiIPoijlREQW9MMTyLxChJDS4Op4A3P5jknIa2W5kbEYMg2Du7HJsA3mchftENXOvuEl9MwIzgbXgTsCyiPURzgH1bUeejYHR2PDYQyMUOOC7ojg4DpXQ8%2FioG5wDOxGQNmFxE6q9xb0DAjKBkfDKahxQwsn1psXMtmCcqJxCGpeILOT694DPbeD8l2eBjVXkNDJ9XaATM2ganBpGCHzGPGdXG8J%2FIWeo0H5sX4MGW%2Bkc3K99fALet4jSVA1ujHU9HVifZGhDofuKBCU3%2BXtkPmBqBY8eHQb6qqCZ5D5ijxBvTT0hMwaC%2B7LietIacG1cdAVN6DmhLkynL3DoWagFdPG31iOJsiJHMiNxpiOU%2FgFNW%2FQEeFseObw9jY6ErwgM9qKe2dYsXnghV1ogUhWPmdWPMYf%2BKCevQ3fAJmNVt6fFuNwBE%2FxGu9wBZsxAZUQ5f%2BUkwj5A%2Fp%2Bm8qQyW9vo4spPekvJAzir1kD5RmqKOevKgue8I6odBFk1gdxozdCjy9iK52mzHlHrqyuQqa%2FnWXGwVQ8hwvaBlK3h5z6qkOqMxqtF54ADyEz1MayiuILZD4gfADXdoHMFnEuD4x4IGaNHx39MYuHs5BZh2hWlFEBv6HlN8bjCLTEUzcr8FgZAXaJ88ehpS6WQk8RZ0wTF0LmFtJYuIBwgxYflDEdXwct%2FVBVXF8VWg6I7eSnYiNSyzmxdaVnp%2Fi%2BT8Ju3MIXvMA5TEQeaxtfGz%2BU6Wl5M9dmxA7IjBTn38vxOoB3srrSmRXFM%2Fgjv5gXfIYWI%2B7DkuxHMmsanlzZSfFDF3E%2BMRbAFzJfEdV0TW7InDYdzyU2KcKjEfS4Qstc5XmGKivBdWiNzEiEZMiBJlgIF%2FE8ma2a9mGgsu4djhHwFIV%2BNPMuT4TMMGUjsJf4Wn2GnreIKcpJrSxW3BHJgu2vyTDiOaJY%2B3EvgDeQ%2BYPJiAsX6EkuOqpXkCmMpPgLV6VhA6FnhTgeH8%2FxA6OhJ5eFz94DWnpa2%2BiaeAA9RmQ3ncsBPW%2FEPeUh44EI4t0fYxBRPhUu4vhuaCmPZtCTx4rnv4BTll6cXRnG1ouPck3R6enZJ%2B7dBJljiAEXeCK%2Bstb2VxZAKVFWlCvL%2FIgoVjR6KJ5ash08CT7Q8hrlTOeOQssc8fHRs0ksIP5CZhL6Q8s4UVdmuOGtMh6nEn9vgsHia1XZyk%2FqAOwJ7ILUuA09a5Tv3jo5R1dmVXtNx8aKF0vPUHyFC%2BIo31dPVMZ3sWcWDmdEb63Fw4YGR8JdNDB3QTlRsR96y%2FPK%2BLrH9PcaynQztejZx0AdivqLnZsT%2BIuueCzqrSreISO%2BYzaSWdnguNiFcYFNIX2gp3EA10QU8%2Bp5pmMJ4a%2BM51pOohpkXiGK6b6uYoPhj%2Fg1paW6eLHltzPRyeYzdzIp3KFnWiC%2FZOrpJI4fgpoSSAijMjWVG%2F1%2BJk8wDvEMQRVlTe2N2GY6twdiyMoizhVWZmZrxLkpeIh6Zv51QyRDUEbMulygZ7uZn29XqUOTck0t7MU0xDCE5JjGQ5mVyvmY2A6ZooZQGrmOlvFAHZTGKHyHzGBDWIjeI1uQOYawEjHbMZdvcigJK42OhEXwgcxbTEE8Q1iMWNdmRW4kNoSx%2FA%2FPglHs%2FlyVpAAAAABJRU5ErkJggg%3D%3D)](https://github.com/sass)


## Overview

`uf` provides a starting base for building any micro-frontend application that has SSR by default and integrates within the uSwitch infrastructure. Instead of being an NPM package, `uf` is a scaffold app that uses [hygen](https://github.com/jondot/hygen) to generate the core files depending on how you feel like building your application.

`uf` provides the following core functionality:

* React hybrid application based on [razzle](https://github.com/jaredpalmer/razzle)
* 🆘 Robust error catching and [timeouts](https://github.com/uswitch/koa-timeout) - [Sentry](https://sentry.io) integration by default
* 🕵️‍♂️ [Tracing](https://github.com/uswitch/koa-tracer) and [Logging](https://github.com/uswitch/koa-access)
* <img src="https://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg" width="20" alt="sass" /> Sass with [ustyle](https://github.com/uswitch/ustyle) integration
* 👾 SSI support (server side includes) that by default provide the uSwitch header / footer
* <img src="https://github.com/kubernetes/kubernetes/blob/master/logo/logo.svg" width="20" alt="Kubernetes" /> Kubernetes support out of the box with auto scaling based on RPS
* ⚖️ A choice between [redux](https://github.com/reactjs/react-redux) and [apollo-graphql](https://www.apollographql.com/) for your state management
* ⚡️ Lightning fast server code with routing using [Koa](https://github.com/koajs/koa)
* [ustyle-react](https://github.com/uswitch/ustyle-react) integration for shared React web components


`uf` doesn't try and push you into a specific pattern, it merely gets you up and running with all the stuff you need for a production ready application. We have specifically left it all open so you can tweak it and change it as you wish.

**This is still a work in progress, expect the core files to change as we add more cool stuff to it and give you more flexibility on your core packages**

### Assumptions

We assume you have a good working knowledge of `React`, `redux`, `graphql` and async node. The core package includes

* [Koa-core](https://github.com/uswitch/koa-core)
* [Razzle](https://github.com/jaredpalmer/razzle)
* [React-helmet](https://github.com/staylor/react-helmet-async)
* [React-router-dom](https://github.com/ReactTraining/react-router)
* [redux](https://github.com/reactjs/react-redux)
* [backstopjs](https://github.com/garris/BackstopJS)


## Getting started

We recommend you clone this repository and set a different origin to track `uf` whilst pushing to your app repository. This allows you to fetch `uf` changes and rebase them on top of your app if we add any future delicious code.

Let's assume your new app is called `my-app` and you are using Github for your repository

    $ git clone https://github.com/uswitch/uf.git my-app --origin uf
    $ git clean
    $ git remote add origin https://github.com/my-org/my-app
    $ git push -u origin master

This will keep the `uf` history and you can then fetch and rebase on your branch if anything changes

    $ git fetch uf
    $ git rebase uf/master

Or

    $ git merge uf/master

We realise this isn't the nicest way of going about it, but we want to give everyone the flexibility of taking what is already here and working with it. **It is your responsibility** to keep it up to date with the core `uf` project if you so wish.

#### Quickstart

```sh
APP_NAME=your-app-name
TEAM_NAME=your-team-name

npx hygen base new --app=$APP_NAME --team=$TEAM_NAME
npx hygen deployment new --app=$APP_NAME --team=$TEAM_NAME
npx hygen backstop new --app=$APP_NAME --namespace=$TEAM_NAME

u drone init --front-end --namespace=$TEAM_NAME

npx hygen sentry new --app=$APP_NAME --dsn=<Sentry DSN>
```

## Generating

Now that you have the files necessary to generate your application, we use `hygen` to give you the additional files that are specific to your project.

To get an understanding of the options needed in `hygen`, you can run:

    $ npx hygen

This will show you all the base commands you have. To read more on this go to [Hygen.io](http://www.hygen.io/). Below is an example of detailed help for the `base` command:

    $ npx hygen base help

![carbon 1](https://user-images.githubusercontent.com/1567681/42219346-8896f88e-7ec3-11e8-9a0d-1d1f5e7cf6c7.png)


Generating the base is app is very straightforward

    $ npx hygen base new --app=my-app --team=my-team

![carbon](https://user-images.githubusercontent.com/1567681/42219311-701da118-7ec3-11e8-83d5-74ac36bc792e.png)

### Component generators

You can generate a new React component, with Jest tests included by running:

    $ npx hygen component new --name=hero

If you want to connect it with redux, you can run

    $ npx hygen component new --name=hero --connect

### Reducer generators

To simplify generating actions, reducers and selectors, we also have a `redux` method. This will set you up with a new Redux action and the ways we like to interact with it.

    $ npx hygen redux new --name=init

### Route declaration

To declare your routes for your app see `routes.js`

`routes.js` must export an array of routes

```js
import setJob from './redux/job-actions.js'
import Job from './components/job.jsx'

export default [
  {
    path: '/job/:id',
    component: Job,
    exact: true,
    reduxActions: async ({ params, query }) => {
      const { data } = await doSomeAsyncStuffHere(params.id)
      return [ setJob(data) ]
    }
  }
]
```

### Code Splitting

Code splitting can be used with loadable-components <https://github.com/smooth-code/loadable-components>  
To enable, wrap your component in `loadable(() => import('./path/to/component'))`, this makes most sense in `routes.js`

```js
import loadable from '@loadable/component'

export default ({ fetchClient } = {}) => [
  {
    path: '/',
    component: loadable(() => import('./components/main')),
    ...
  }
]
```

### Imgix Images

An image helper component is in `components/helpers/imgix-image.jsx`, this
will automatically add srcsets and lazy loading.

`<ImgixImage>` requires props:  
`src`, `width`, `height`, `sizes`, `alt`, `className` - as a normal `<img>`  
`critical` - if set will skip lazy loading

Other props are passed to the react-imgix component <https://github.com/imgix/react-imgix#props>

### `<DontHydrate>` component

A `<DontHydrate>` component is in `components/helpers/dont-hydrate.jsx`, this
can wrap any other components and prevents them from being hydrated during page load.

This can be used for components that are server side rendered and do not need
hydrating, e.g. static editorial content.

## Running

    $ npm install
    $ npm start

#### Environment variables

**Do not** use the non-razzle versions of `process.env` variables, i.e. `process.env.NODE_ENV`. These will contain the build time values.

Because **Razzle** stitches in all `process.env` variables into the
application at build time, we need to use `RAZZLE_...` environment
variables to work at runtime.

+ `RAZZLE_NODE_ENV` - The server environment, _i.e._ development, staging, production
+ `RAZZLE_ZIPKIN_LOCAL` - Whether or not to report zipkin traces to a server in development

## Building

To generate a production bundle for your application, you can run

    $ npm run build

### Analysing

To understand your dependency tree, you can run `webpack-bundle-analyzer` in your project to get an idea of where the bloat lies. We recommend you run this with a production build rather than with `npm start`

    $ ANALYZE=true npm run build

Navigate to http://localhost:8081 to see the analysis.

## Deployment

Currently a `uf` project is set up to deploy to kubernetes, through a `drone` deploy. The drone deployment is core to the uSwitch infrastructure, but similar build processes can be done anywhere to facilitate the Kubernetes deployment.

Your `team` should be your Kubernetes namespace

### Generate a deployment scaffold

    $ npx hygen deployment new --app=my-app --team=my-team

### Multi-cluster mode

**Please use `multi-cluster` in Kube if operating any consumer facing applications**

    $ npx hygen deployment new --app=my-app --team=my-team --multiCluster

To enable multi cluster you need to auth on each cluster

    $ u kauth red
    $ u kauth black
    $ u kauth blue

Then run `u drone init` like so

    $ u drone init --front-end --namespace=kube-namespace --cluster=black --cluster=red --cluster=blue

See more documentation here: https://uswitch-readme.atlassian.net/wiki/spaces/CLOUD/pages/312639495/Multi-Cluster+Applications

![carbon 2](https://user-images.githubusercontent.com/1567681/42221174-225fd3be-7ec9-11e8-98a5-24418d988081.png)

### Set up backstop for automatic visual regression testing

If you are within the uSwitch infrastructure this will automatically add **visual regression testing** to your CI.

    $ npx hygen backstop new --app=my-app --team=my-team

Your `app` should be the same you used in the deployment scaffold.
Your `team` should be your Kubernetes namespace.

**This will set up everything you need for visual regression testing.**

#### How does it work:
- Deploy your app to production (specified in backstop.json, and automatically points to internal.usw.co)
- Make a change
 - Without changes the bot will not notice any changes.
- Deploy your app to staging
 - The CI will create a container and run backstopjs to diff screenshots of production and staging
 - After, the images will be uploaded to the projects s3 asset bucket
 - A short list of this images will also be uploaded to this folder for the uSwitch bot to pick up
- Open a PR
 - uSwitch bot will pick up the list of images in S3 and post a comment to your projects PR
- Let your designer take a look!

#### Configuration:
You can find all the configuration options in backstop.json

For example, the screen sizes you want to diff.
Certain scenario's you want to play out. Like testing your user Journey.

### Set up your drone build

This assumes you have the `u` tool correctly set up. You'll need to initialise the drone repository like so:

    $ u drone init --front-end --namespace=my-team

### Sentry sourcemaps

`uf` uses **Sentry** for error reporting - to set this up, you must
[create a new **Sentry
project**](https://sentry.io/organizations/uswitchcom/projects/new/)
with the **same name** as your application. Then, grab your DSN from

<p align='center'>
  https://sentry.io/settings/uswitchcom/<b>your-app-name</b>/keys/
</p>

    $ npx hygen sentry new --app=my-app --dsn=sentry-dsn


### Deployment

    $ u deploy create -e {staging,production}

Will successfully deploy your application.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars1.githubusercontent.com/u/5881414?v=4" width="100px;"/><br /><sub><b>Dom Charlesworth</b></sub>](http://domcharlesworth.co.uk)<br />[💻](https://github.com/uSwitch/uf/commits?author=domtronn "Code") [📖](https://github.com/uSwitch/uf/commits?author=domtronn "Documentation") [🤔](#ideas-domtronn "Ideas, Planning, & Feedback") [🔌](#plugin-domtronn "Plugin/utility libraries") | [<img src="https://avatars3.githubusercontent.com/u/1567681?v=4" width="100px;"/><br /><sub><b>David Annez</b></sub>](http://davidannez.com)<br />[💻](https://github.com/uSwitch/uf/commits?author=annez "Code") [📖](https://github.com/uSwitch/uf/commits?author=annez "Documentation") [🤔](#ideas-annez "Ideas, Planning, & Feedback") [🔌](#plugin-annez "Plugin/utility libraries") | [<img src="https://avatars3.githubusercontent.com/u/4057948?v=4" width="100px;"/><br /><sub><b>Phil Helm</b></sub>](http://phelm.co.uk)<br />[💻](https://github.com/uSwitch/uf/commits?author=phelma "Code") [📖](https://github.com/uSwitch/uf/commits?author=phelma "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/182303?v=4" width="100px;"/><br /><sub><b>Tomasz Tomczyk</b></sub>](http://tomasztomczyk.com/)<br />[📖](https://github.com/uSwitch/uf/commits?author=tomasz-tomczyk "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/1152272?v=4" width="100px;"/><br /><sub><b>Zen</b></sub>](https://github.com/zzeniou86)<br />[💻](https://github.com/uSwitch/uf/commits?author=zzeniou86 "Code") | [<img src="https://avatars1.githubusercontent.com/u/1517957?v=4" width="100px;"/><br /><sub><b>dcampoy</b></sub>](https://github.com/dcampoy)<br />[💻](https://github.com/uSwitch/uf/commits?author=dcampoy "Code") |
| :---: | :---: | :---: | :---: | :---: | :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

## Todo


* [x] General scaffolding
* [x] Catching template render errors
* [x] Return 500 if server error
* [x] Inject env variables in build for staging/production
* [ ] Add in routing to catch 404's
* [x] Install additional package dependencies
* [ ] Slack notifications
* [ ] Staging environment
* [ ] Grafana dashboards
* [ ] API scaffolding
* [ ] Error reporting (sentry API generation)
* [ ] Demo branch
* [ ] Basic tests
* [ ] Graphql example
* [ ] SNS alerts in Grafana?
* [x] Error codes
* [ ] Investigate response time in grafana
  * Status, Request count
* [ ] Imgix helper
* [ ] Investigate node sass relative path assets
