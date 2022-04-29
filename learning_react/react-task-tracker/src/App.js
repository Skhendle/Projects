import { useState } from 'react'
import Header from "./components/Header";
import { Addtask } from './components/Addtask';
import Tasks from "./components/Tasks"
function App() {
  const [tasks, setTasks] = useState(
    [
          {
            "id": "62500c738b42a15526784660",
            "text": "Cillum excepteur fugiat aliquip magna nulla nulla amet minim laboris magna. Incididunt nostrud reprehenderit ullamco anim voluptate consectetur consectetur cillum irure. Ipsum in in deserunt incididunt. Dolor non mollit consectetur minim irure id. Anim pariatur sunt ullamco aliquip consectetur ex. Ut officia velit duis laboris occaecat mollit cillum nisi sint nostrud quis Lorem nisi pariatur.\r\n",
            "day": "2018-08-21T11:52:47 -02:00",
            "reminder": false
          },
          {
            "id": "62500c7389190638ed82c813",
            "text": "Sint veniam proident do est mollit quis. Commodo consectetur velit enim deserunt. Occaecat aliqua id consequat consequat consectetur aliqua reprehenderit ut. Ipsum aliqua ipsum velit qui incididunt. Dolor mollit ea voluptate est laboris tempor amet pariatur sit proident. Nulla reprehenderit do quis irure amet commodo. Eu mollit proident incididunt irure tempor eiusmod proident ipsum.\r\n",
            "day": "2020-09-25T10:22:30 -02:00",
            "reminder": false
          },
          {
            "id": "62500c739ead30795843d66e",
            "text": "Reprehenderit incididunt laborum dolore commodo eu reprehenderit nisi nulla fugiat sunt mollit pariatur. Fugiat ut ad consectetur commodo exercitation dolor. Ut velit voluptate reprehenderit est. Sunt laborum ea cillum in excepteur ex velit dolor tempor deserunt et. Aliqua reprehenderit minim proident nostrud voluptate anim eu velit.\r\n",
            "day": "2019-07-10T06:17:17 -02:00",
            "reminder": true
          },
          {
            "id": "62500c7382e024feb7e4edde",
            "text": "In ut nulla elit cupidatat et anim do enim pariatur anim. Mollit aliqua eu esse dolor est pariatur dolor consectetur laboris do quis velit. Laborum cupidatat minim cillum est magna irure consectetur officia adipisicing eu sint magna aliquip culpa. Cillum culpa commodo ipsum laborum non consequat ad deserunt amet incididunt esse Lorem sint.\r\n",
            "day": "2019-12-03T12:26:08 -02:00",
            "reminder": true
          },
          {
            "id": "62500c735b03b2ed09934b2b",
            "text": "Esse do cillum fugiat pariatur quis. Lorem do ipsum non irure quis velit eiusmod id nisi pariatur non laborum. Id quis proident Lorem nisi proident minim minim ipsum in proident anim. Eiusmod deserunt est amet qui ad exercitation incididunt.\r\n",
            "day": "2020-09-18T12:16:54 -02:00",
            "reminder": true
          },
          {
            "id": "62500c7353a37c3ff00ffa03",
            "text": "Lorem reprehenderit velit nostrud nisi quis dolore consectetur. Qui veniam minim enim adipisicing aliqua. Officia fugiat quis ad commodo voluptate proident.\r\n",
            "day": "2015-02-01T04:44:02 -02:00",
            "reminder": false
          }
        ]
  )

  const deleteTask = (id) => {
    setTasks(tasks.filter((task) => task.id !== id))
  }

  const toggleReminder = (id) => {
    setTasks(tasks.map((task) => task.id === id?{...task, reminder: !task.reminder}:task))
  }
  return (
    <div className="container">
      <Header/>
      <Addtask/>
      {tasks.length > 0 ?(
        <Tasks tasks={tasks} onDelete ={deleteTask} onToggle={toggleReminder}/>
      ):'No Task To Show'}
    </div>
  );
}

export default App;
