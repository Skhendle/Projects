import React, {useState, useEffect} from 'react'
import axios from 'axios'

function Dropdown({countries, onChangeCountry}){
  return (
    <div className='header btn'>
       {/* <select onChange={}></select> */}
        <select onChange={(e) => onChangeCountry(e.target.value)}>
        {
            countries.map(country => 
                <option value={country.id} key={country.id}>{country.name}</option>
            )
        }

  
</select>
    </div>
  )
}

export default Dropdown