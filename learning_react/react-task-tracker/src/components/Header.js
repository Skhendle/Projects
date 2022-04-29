import React from 'react'
import Button from './Button'

const Header = ({title, onAdd, showAdd}) => {
  return (
      <header className='header'>
            <h1>{title}</h1>
            <Button name={showAdd ? 'Close' : 'Add'} color={showAdd ? 'red' : 'green'} onClick={onAdd}/>
      </header>
  )
}

export default Header