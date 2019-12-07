---
to: ./.jest.config.js
---
import { configure } from 'enzyme'
import Adapter from 'enzyme-adapter-<%= locals.adapter || 'react-16' %>'

configure({ adapter: new Adapter() })
