import React, { useEffect, useState} from "react";
import Dropdown from './components/Dropdown'
import { SelectedCountry } from "./components/SelectedCountry";

import axios from 'axios'

function App() {
  const [countryId, setCountryId] = useState(-1)
  const [countries, setCountries] = useState([])


  useEffect(()=>{
    console.log(countryId)
    if(countryId === -1){
        axios.get('https://b40d-197-229-148-158.ngrok.io/')
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



// const fetchCountryList = () => {
//   axios.get('https://b40d-197-229-148-158.ngrok.io/')
//     .then(res =>{
//         return res.data
//     }).then(data => {
//       setCountries(data)
//       setCountryId(data[0].id)
//     }).catch(  err => 
//         console.log(err)
//     )
// }

// const fetchCountryData = () => {
  // console.log(`country id ${countryId}`)
  // axios.get(`https://b40d-197-229-148-158.ngrok.io/get_country?id=${countryId}`)
  // .then(res =>{
  //     setCountryData(res.data)
  // }).catch(  err => 
  //     console.log(err)
  //   )
// }

  const onChangeCountry = (cId) =>{
   setCountryId(cId)
  }



  return (
    
       countryId === -1 ? null : (
          <div className="container">
          <Dropdown countries = {countries} onChangeCountry={onChangeCountry}/>
          <h3>{countryId}</h3>
          <SelectedCountry countryId={countryId} /> 
          </div>
         )

  );
}

export default App;
