import React from 'react'
import {FaTimes} from 'react-icons/fa'

const Task = ({task}) => {
  return (
    <div className='task'>
        <h3>{task.day} <FaTimes style={{
            color: 'red',
            cursor: 'pointer'
        }}/></h3>
        <p>{task.text}</p>

    </div>
  )
}

export default Task