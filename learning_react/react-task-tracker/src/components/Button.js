import React from 'react'
import PropTypes from 'prop-types'
const Button = ({name, color, onClick}) => {
  return (
    <button
    onClick={onClick} 
    style={{backgroundColor: color}}
    className='btn'>
        {name}
    </button>
  )
}

Button.defaultProps = {
    color: 'steelblue'
}

Button.prototype = {
    name: PropTypes.string,
    color: PropTypes.string,
    onClick: PropTypes.func
}
export default Button