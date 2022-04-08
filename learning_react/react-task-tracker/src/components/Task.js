import React from 'react'
import {FaTimes} from 'react-icons/fa'

const Task = ({task, onDelete}) => {
  return (
    <div className='task'>
        <h3>{task.day} <FaTimes style={{
            color: 'red',
            cursor: 'pointer'
        }}
        onClick={()=> onDelete(task.id)}
        /></h3>
        <p>{task.text}</p>

    </div>
  )
}

export default Task