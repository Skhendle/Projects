import React, { useEffect, useState} from "react";
import axios from 'axios'



export const SelectedCountry = (props) => {
    const [countryData, setCountryData] = useState(null)

    useEffect(()=>{
        
        axios.get(`https://b40d-197-229-148-158.ngrok.io/get_country?id=${props.countryId}`)
        .then(res =>{
            console.log(res.data)
            setCountryData(res.data)
        }).catch(  err => 
            console.log(err)
            )
        },[props.countryId])

    return (
        countryData === null ? null : (
            <div className='task'>
                <h1><span style="color:blue">{countryData.country}</span></h1>
            <h1>Capital City :<br/>{countryData.capital_city}</h1>
            <h1>Abbreviation :<br/>{countryData.abbreviation}</h1>
            <h1>Continent :<br/>{countryData.continent}</h1>
            <h1>location :<br/>{countryData.location}</h1>
            {/* <h1>Capital City :<br/>{countryData.continent}</h1>
            <h1>Capital City :<br/>{countryData.country}</h1>
            <h1>Capital City :<br/>{countryData.location}</h1>
            <h1>Capital City :<br/>{countryData.sq_km_area}</h1>
            <h1>Capital City :<br/>{countryData.updated}</h1> */}
    
        </div>
           )

  )
}
