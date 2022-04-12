import React from 'react'

export const SelectedCountry = ({countryData}) => {
  return (
    <div className='task'>
        <h1>{countryData.capital_city}</h1>
        <h1>{countryData.abbreviation}</h1>
        <h1>{countryData.capital_city}</h1>
        <h1>{countryData.confirmed}</h1>
        <h1>{countryData.continent}</h1>
        <h1>{countryData.country}</h1>
        <h1>{countryData.location}</h1>
        <h1>{countryData.sq_km_area}</h1>
        <h1>{countryData.updated}</h1>

    </div>
  )
}
