import React, { useEffect, useState} from "react";


import axios from 'axios'



export const SelectedCountry = (props) => {
    const [countryData, setCountryData] = useState(null)

    useEffect(()=>{
        
        axios.get(`https://971f-197-229-136-149.ngrok.io/get_country?id=${props.countryId}`)
        .then(res =>{
            setCountryData(res.data)
        }).catch(  err => 
            console.log(err)
            )
        },[props.countryId])

    return (
        countryData === null ? null : (
            <div className='task'>
            <img src={`https://countryflagsapi.com/png/${countryData.country.toLowerCase()}`}
        height={200} width={`100%`}   border={`1px solid steelblue`} />

                <h1><span style={{color:'blue'}}>{countryData.country}</span></h1>
            <h4>
                <span style={{color:'red'}}>Capital City</span><br/>{countryData.capital_city}</h4>
            <h4><span style={{color:'red'}}>Abbreviation</span><br/>{countryData.abbreviation}</h4>
            <h4><span style={{color:'red'}}>Continent</span><br/>{countryData.continent}</h4>
            <h4><span style={{color:'red'}}>Location</span><br/>{countryData.location}</h4>
        </div>
           )

  )
}
