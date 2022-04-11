import React from 'react'
import {FaTimes} from 'react-icons/fa'

const Task = ({task, onDelete, onToggle}) => {
  return (
    <div className={`task ${task.reminder ? 'reminder':''}`} onDoubleClick={() => onToggle(task.id)}>
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