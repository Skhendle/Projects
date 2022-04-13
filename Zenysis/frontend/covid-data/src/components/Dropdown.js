import React from 'react'


function  Dropdown({countries, onChangeCountry}){
  return (
    <div className='countryData'>
        <select className={{ width: '100%', height: '100%'}} onChange={(e) => onChangeCountry(e.target.value)}>
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