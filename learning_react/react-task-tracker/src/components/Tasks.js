import React from 'react'
import Task from './Task'
import PropTypes from 'prop-types'

const Tasks = ({tasks, onDelete, onToggle}) => {

  return (
    <>
        {tasks.map((task) => (
            <Task key={task.id} task={task} onDelete={onDelete} onToggle={onToggle}/>
        ))}
    </>
  )
}

Tasks.prototype = {
  onDelete: PropTypes.func
}
export default Tasks