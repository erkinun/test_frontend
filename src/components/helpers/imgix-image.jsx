import React from 'react'
import Imgix from 'react-imgix'

const defaultImigxParams = {
  auto: 'compress,format'
}

const ImgixImage = ({
  src,
  width,
  height,
  sizes,
  alt,
  className = '',
  itemProp,
  critical,
  imgixParams,
  ...props
}) => {
  if (!src) {
    return <span style={{
      width,
      height,
      display: 'inline-block'
    }} />
  }
  return <Imgix
    htmlAttributes={{ alt, itemProp }}
    attributeConfig={!critical && {
      src: 'data-src',
      srcSet: 'data-srcset',
      sizes: 'data-sizes'
    }}
    className={`${!critical ? 'lazyload' : ''} ${className}`}
    src={src}
    height={height}
    width={width}
    sizes={sizes}
    imgixParams={{
      ...defaultImigxParams,
      ...imgixParams
    }}
    {...props}
  />
}

export default React.memo(ImgixImage)
