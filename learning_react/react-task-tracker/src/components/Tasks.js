import React from 'react'
import Task from './Task'
import PropTypes from 'prop-types'

const Tasks = ({tasks, onDelete}) => {

  return (
    <>
        {tasks.map((task) => (
            <Task key={task.id} task={task} onDelete={onDelete}/>
        ))}
    </>
  )
}

Tasks.prototype = {
  onDelete: PropTypes.func
}
export default Tasks