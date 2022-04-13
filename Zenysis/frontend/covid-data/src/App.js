import React, { useEffect, useState} from "react";
import Dropdown from './components/Dropdown'
import { SelectedCountry } from "./components/SelectedCountry";

import axios from 'axios'
import { DeathToll } from "./components/DeathTolls";

function App() {
  const [countryId, setCountryId] = useState(-1)
  const [countries, setCountries] = useState([])


  useEffect(()=>{
      console.log(countryId)
      if(countryId === -1){
          axios.get('https://971f-197-229-136-149.ngrok.io/')
        .then(res =>{
            return res.data
        }).then(data => {
          setCountries(data)
          setCountryId(data[0].id)
        }).catch(  err => 
            console.log(err)
        )
      }
  }, [countryId])


  const onChangeCountry = (cId) =>{
   setCountryId(cId)
  }



  return (    
       countryId === -1 ? null : (
          <div className="container">
          <Dropdown countries = {countries} onChangeCountry={onChangeCountry}/>
          <SelectedCountry countryId={countryId} /> 
          <DeathToll countryId={countryId}/>
          </div>
         )

  );
}

export default App;
