import React, { useEffect, useState} from "react";
import { PieChart } from 'react-minimal-pie-chart';
import axios from 'axios'



export const DeathToll = (props) => {
    const [deathTollData, setDeathTollData] = useState(null)

    useEffect(()=>{
        axios.get(`https://971f-197-229-136-149.ngrok.io/get_death_toll?id=${props.countryId}`)
        .then(res =>{
            console.log(res.data)
            setDeathTollData(res.data)
        }).catch(  err => 
            console.log(err)
            )
        },[props.countryId])

    return (
        deathTollData === null ? null : (
            <div className='task'>
                <h2>Death Toll</h2>
           <PieChart
              animation
              animationDuration={500}
              animationEasing="ease-out"
                data={deathTollData}
                outerRadius={'90%'}
                innerRadius={'80%'}
                labelRadius={'100%'}
            />
            
            <style jsx>{`
        .task {
          height: 500px;
          margin-left: auto;
          margin-right: auto;
          width: 100;
        }

      `}</style>
            </div>
           )

  )
}


