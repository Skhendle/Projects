import React from 'react'
import Button from './Button'

const Header = () => {

    const onClick = () => {
        console.log('Click')
    }

  return (
      <header className='header'>
            <h1>Task Tracker</h1>
            <Button name="Add" color='green' onClick={onClick}/>
      </header>
  )
}

export default Header