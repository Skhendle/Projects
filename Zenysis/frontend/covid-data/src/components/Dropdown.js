import React from 'react'
import { useState } from 'react'

const data = [
  {
    "available_places": 1, 
    "id": 1, 
    "name": "Afghanistan"
  }, 
  {
    "available_places": 1, 
    "id": 2, 
    "name": "Albania"
  }, 
  {
    "available_places": 1, 
    "id": 3, 
    "name": "Algeria"
  }, 
  {
    "available_places": 1, 
    "id": 4, 
    "name": "Andorra"
  }, 
  {
    "available_places": 1, 
    "id": 5, 
    "name": "Angola"
  }, 
  {
    "available_places": 1, 
    "id": 6, 
    "name": "Antarctica"
  }, 
  {
    "available_places": 1, 
    "id": 7, 
    "name": "Antigua and Barbuda"
  }, 
  {
    "available_places": 1, 
    "id": 8, 
    "name": "Argentina"
  }, 
  {
    "available_places": 1, 
    "id": 9, 
    "name": "Armenia"
  }, 
  {
    "available_places": 9, 
    "id": 10, 
    "name": "Australia"
  }, 
  {
    "available_places": 1, 
    "id": 11, 
    "name": "Austria"
  }, 
  {
    "available_places": 1, 
    "id": 12, 
    "name": "Azerbaijan"
  }, 
  {
    "available_places": 1, 
    "id": 13, 
    "name": "Bahamas"
  }, 
  {
    "available_places": 1, 
    "id": 14, 
    "name": "Bahrain"
  }, 
  {
    "available_places": 1, 
    "id": 15, 
    "name": "Bangladesh"
  }, 
  {
    "available_places": 1, 
    "id": 16, 
    "name": "Barbados"
  }, 
  {
    "available_places": 1, 
    "id": 17, 
    "name": "Belarus"
  }, 
  {
    "available_places": 13, 
    "id": 18, 
    "name": "Belgium"
  }, 
  {
    "available_places": 1, 
    "id": 19, 
    "name": "Belize"
  }, 
  {
    "available_places": 1, 
    "id": 20, 
    "name": "Benin"
  }, 
  {
    "available_places": 1, 
    "id": 21, 
    "name": "Bhutan"
  }, 
  {
    "available_places": 1, 
    "id": 22, 
    "name": "Bolivia"
  }, 
  {
    "available_places": 1, 
    "id": 23, 
    "name": "Bosnia and Herzegovina"
  }, 
  {
    "available_places": 1, 
    "id": 24, 
    "name": "Botswana"
  }, 
  {
    "available_places": 28, 
    "id": 25, 
    "name": "Brazil"
  }, 
  {
    "available_places": 1, 
    "id": 26, 
    "name": "Brunei"
  }, 
  {
    "available_places": 1, 
    "id": 27, 
    "name": "Bulgaria"
  }, 
  {
    "available_places": 1, 
    "id": 28, 
    "name": "Burkina Faso"
  }, 
  {
    "available_places": 1, 
    "id": 29, 
    "name": "Burma"
  }, 
  {
    "available_places": 1, 
    "id": 30, 
    "name": "Burundi"
  }, 
  {
    "available_places": 1, 
    "id": 31, 
    "name": "Cabo Verde"
  }, 
  {
    "available_places": 1, 
    "id": 32, 
    "name": "Cambodia"
  }, 
  {
    "available_places": 1, 
    "id": 33, 
    "name": "Cameroon"
  }, 
  {
    "available_places": 17, 
    "id": 34, 
    "name": "Canada"
  }, 
  {
    "available_places": 1, 
    "id": 35, 
    "name": "Central African Republic"
  }, 
  {
    "available_places": 1, 
    "id": 36, 
    "name": "Chad"
  }, 
  {
    "available_places": 18, 
    "id": 37, 
    "name": "Chile"
  }, 
  {
    "available_places": 35, 
    "id": 38, 
    "name": "China"
  }, 
  {
    "available_places": 35, 
    "id": 39, 
    "name": "Colombia"
  }, 
  {
    "available_places": 1, 
    "id": 40, 
    "name": "Comoros"
  }, 
  {
    "available_places": 1, 
    "id": 41, 
    "name": "Congo (Brazzaville)"
  }, 
  {
    "available_places": 1, 
    "id": 42, 
    "name": "Congo (Kinshasa)"
  }, 
  {
    "available_places": 1, 
    "id": 43, 
    "name": "Costa Rica"
  }, 
  {
    "available_places": 1, 
    "id": 44, 
    "name": "Cote d'Ivoire"
  }, 
  {
    "available_places": 1, 
    "id": 45, 
    "name": "Croatia"
  }, 
  {
    "available_places": 1, 
    "id": 46, 
    "name": "Cuba"
  }, 
  {
    "available_places": 1, 
    "id": 47, 
    "name": "Cyprus"
  }, 
  {
    "available_places": 1, 
    "id": 48, 
    "name": "Czechia"
  }, 
  {
    "available_places": 3, 
    "id": 49, 
    "name": "Denmark"
  }, 
  {
    "available_places": 1, 
    "id": 50, 
    "name": "Diamond Princess"
  }, 
  {
    "available_places": 1, 
    "id": 51, 
    "name": "Djibouti"
  }, 
  {
    "available_places": 1, 
    "id": 52, 
    "name": "Dominica"
  }, 
  {
    "available_places": 1, 
    "id": 53, 
    "name": "Dominican Republic"
  }, 
  {
    "available_places": 1, 
    "id": 54, 
    "name": "Ecuador"
  }, 
  {
    "available_places": 1, 
    "id": 55, 
    "name": "Egypt"
  }, 
  {
    "available_places": 1, 
    "id": 56, 
    "name": "El Salvador"
  }, 
  {
    "available_places": 1, 
    "id": 57, 
    "name": "Equatorial Guinea"
  }, 
  {
    "available_places": 1, 
    "id": 58, 
    "name": "Eritrea"
  }, 
  {
    "available_places": 1, 
    "id": 59, 
    "name": "Estonia"
  }, 
  {
    "available_places": 1, 
    "id": 60, 
    "name": "Eswatini"
  }, 
  {
    "available_places": 1, 
    "id": 61, 
    "name": "Ethiopia"
  }, 
  {
    "available_places": 1, 
    "id": 62, 
    "name": "Fiji"
  }, 
  {
    "available_places": 1, 
    "id": 63, 
    "name": "Finland"
  }, 
  {
    "available_places": 12, 
    "id": 64, 
    "name": "France"
  }, 
  {
    "available_places": 1, 
    "id": 65, 
    "name": "Gabon"
  }, 
  {
    "available_places": 1, 
    "id": 66, 
    "name": "Gambia"
  }, 
  {
    "available_places": 1, 
    "id": 67, 
    "name": "Georgia"
  }, 
  {
    "available_places": 18, 
    "id": 68, 
    "name": "Germany"
  }, 
  {
    "available_places": 1, 
    "id": 69, 
    "name": "Ghana"
  }, 
  {
    "available_places": 1, 
    "id": 70, 
    "name": "Greece"
  }, 
  {
    "available_places": 1, 
    "id": 71, 
    "name": "Grenada"
  }, 
  {
    "available_places": 1, 
    "id": 72, 
    "name": "Guatemala"
  }, 
  {
    "available_places": 1, 
    "id": 73, 
    "name": "Guinea"
  }, 
  {
    "available_places": 1, 
    "id": 74, 
    "name": "Guinea-Bissau"
  }, 
  {
    "available_places": 1, 
    "id": 75, 
    "name": "Guyana"
  }, 
  {
    "available_places": 1, 
    "id": 76, 
    "name": "Haiti"
  }, 
  {
    "available_places": 1, 
    "id": 77, 
    "name": "Holy See"
  }, 
  {
    "available_places": 1, 
    "id": 78, 
    "name": "Honduras"
  }, 
  {
    "available_places": 1, 
    "id": 79, 
    "name": "Hungary"
  }, 
  {
    "available_places": 1, 
    "id": 80, 
    "name": "Iceland"
  }, 
  {
    "available_places": 38, 
    "id": 81, 
    "name": "India"
  }, 
  {
    "available_places": 1, 
    "id": 82, 
    "name": "Indonesia"
  }, 
  {
    "available_places": 1, 
    "id": 83, 
    "name": "Iran"
  }, 
  {
    "available_places": 1, 
    "id": 84, 
    "name": "Iraq"
  }, 
  {
    "available_places": 1, 
    "id": 85, 
    "name": "Ireland"
  }, 
  {
    "available_places": 1, 
    "id": 86, 
    "name": "Israel"
  }, 
  {
    "available_places": 22, 
    "id": 87, 
    "name": "Italy"
  }, 
  {
    "available_places": 1, 
    "id": 88, 
    "name": "Jamaica"
  }, 
  {
    "available_places": 50, 
    "id": 89, 
    "name": "Japan"
  }, 
  {
    "available_places": 1, 
    "id": 90, 
    "name": "Jordan"
  }, 
  {
    "available_places": 1, 
    "id": 91, 
    "name": "Kazakhstan"
  }, 
  {
    "available_places": 1, 
    "id": 92, 
    "name": "Kenya"
  }, 
  {
    "available_places": 1, 
    "id": 93, 
    "name": "Kiribati"
  }, 
  {
    "available_places": 1, 
    "id": 94, 
    "name": "Korea, South"
  }, 
  {
    "available_places": 1, 
    "id": 95, 
    "name": "Kosovo"
  }, 
  {
    "available_places": 1, 
    "id": 96, 
    "name": "Kuwait"
  }, 
  {
    "available_places": 1, 
    "id": 97, 
    "name": "Kyrgyzstan"
  }, 
  {
    "available_places": 1, 
    "id": 98, 
    "name": "Laos"
  }, 
  {
    "available_places": 1, 
    "id": 99, 
    "name": "Latvia"
  }, 
  {
    "available_places": 1, 
    "id": 100, 
    "name": "Lebanon"
  }, 
  {
    "available_places": 1, 
    "id": 101, 
    "name": "Lesotho"
  }, 
  {
    "available_places": 1, 
    "id": 102, 
    "name": "Liberia"
  }, 
  {
    "available_places": 1, 
    "id": 103, 
    "name": "Libya"
  }, 
  {
    "available_places": 1, 
    "id": 104, 
    "name": "Liechtenstein"
  }, 
  {
    "available_places": 1, 
    "id": 105, 
    "name": "Lithuania"
  }, 
  {
    "available_places": 1, 
    "id": 106, 
    "name": "Luxembourg"
  }, 
  {
    "available_places": 1, 
    "id": 107, 
    "name": "MS Zaandam"
  }, 
  {
    "available_places": 1, 
    "id": 108, 
    "name": "Madagascar"
  }, 
  {
    "available_places": 1, 
    "id": 109, 
    "name": "Malawi"
  }, 
  {
    "available_places": 18, 
    "id": 110, 
    "name": "Malaysia"
  }, 
  {
    "available_places": 1, 
    "id": 111, 
    "name": "Maldives"
  }, 
  {
    "available_places": 1, 
    "id": 112, 
    "name": "Mali"
  }, 
  {
    "available_places": 1, 
    "id": 113, 
    "name": "Malta"
  }, 
  {
    "available_places": 1, 
    "id": 114, 
    "name": "Marshall Islands"
  }, 
  {
    "available_places": 1, 
    "id": 115, 
    "name": "Mauritania"
  }, 
  {
    "available_places": 1, 
    "id": 116, 
    "name": "Mauritius"
  }, 
  {
    "available_places": 34, 
    "id": 117, 
    "name": "Mexico"
  }, 
  {
    "available_places": 1, 
    "id": 118, 
    "name": "Micronesia"
  }, 
  {
    "available_places": 1, 
    "id": 119, 
    "name": "Moldova"
  }, 
  {
    "available_places": 1, 
    "id": 120, 
    "name": "Monaco"
  }, 
  {
    "available_places": 1, 
    "id": 121, 
    "name": "Mongolia"
  }, 
  {
    "available_places": 1, 
    "id": 122, 
    "name": "Montenegro"
  }, 
  {
    "available_places": 1, 
    "id": 123, 
    "name": "Morocco"
  }, 
  {
    "available_places": 1, 
    "id": 124, 
    "name": "Mozambique"
  }, 
  {
    "available_places": 1, 
    "id": 125, 
    "name": "Namibia"
  }, 
  {
    "available_places": 1, 
    "id": 126, 
    "name": "Nepal"
  }, 
  {
    "available_places": 18, 
    "id": 127, 
    "name": "Netherlands"
  }, 
  {
    "available_places": 2, 
    "id": 128, 
    "name": "New Zealand"
  }, 
  {
    "available_places": 1, 
    "id": 129, 
    "name": "Nicaragua"
  }, 
  {
    "available_places": 1, 
    "id": 130, 
    "name": "Niger"
  }, 
  {
    "available_places": 1, 
    "id": 131, 
    "name": "Nigeria"
  }, 
  {
    "available_places": 1, 
    "id": 132, 
    "name": "North Macedonia"
  }, 
  {
    "available_places": 1, 
    "id": 133, 
    "name": "Norway"
  }, 
  {
    "available_places": 1, 
    "id": 134, 
    "name": "Oman"
  }, 
  {
    "available_places": 8, 
    "id": 135, 
    "name": "Pakistan"
  }, 
  {
    "available_places": 1, 
    "id": 136, 
    "name": "Palau"
  }, 
  {
    "available_places": 1, 
    "id": 137, 
    "name": "Panama"
  }, 
  {
    "available_places": 1, 
    "id": 138, 
    "name": "Papua New Guinea"
  }, 
  {
    "available_places": 1, 
    "id": 139, 
    "name": "Paraguay"
  }, 
  {
    "available_places": 27, 
    "id": 140, 
    "name": "Peru"
  }, 
  {
    "available_places": 1, 
    "id": 141, 
    "name": "Philippines"
  }, 
  {
    "available_places": 1, 
    "id": 142, 
    "name": "Poland"
  }, 
  {
    "available_places": 1, 
    "id": 143, 
    "name": "Portugal"
  }, 
  {
    "available_places": 1, 
    "id": 144, 
    "name": "Qatar"
  }, 
  {
    "available_places": 1, 
    "id": 145, 
    "name": "Romania"
  }, 
  {
    "available_places": 84, 
    "id": 146, 
    "name": "Russia"
  }, 
  {
    "available_places": 1, 
    "id": 147, 
    "name": "Rwanda"
  }, 
  {
    "available_places": 1, 
    "id": 148, 
    "name": "Saint Kitts and Nevis"
  }, 
  {
    "available_places": 1, 
    "id": 149, 
    "name": "Saint Lucia"
  }, 
  {
    "available_places": 1, 
    "id": 150, 
    "name": "Saint Vincent and the Grenadines"
  }, 
  {
    "available_places": 1, 
    "id": 151, 
    "name": "Samoa"
  }, 
  {
    "available_places": 1, 
    "id": 152, 
    "name": "San Marino"
  }, 
  {
    "available_places": 1, 
    "id": 153, 
    "name": "Sao Tome and Principe"
  }, 
  {
    "available_places": 1, 
    "id": 154, 
    "name": "Saudi Arabia"
  }, 
  {
    "available_places": 1, 
    "id": 155, 
    "name": "Senegal"
  }, 
  {
    "available_places": 1, 
    "id": 156, 
    "name": "Serbia"
  }, 
  {
    "available_places": 1, 
    "id": 157, 
    "name": "Seychelles"
  }, 
  {
    "available_places": 1, 
    "id": 158, 
    "name": "Sierra Leone"
  }, 
  {
    "available_places": 1, 
    "id": 159, 
    "name": "Singapore"
  }, 
  {
    "available_places": 1, 
    "id": 160, 
    "name": "Slovakia"
  }, 
  {
    "available_places": 1, 
    "id": 161, 
    "name": "Slovenia"
  }, 
  {
    "available_places": 1, 
    "id": 162, 
    "name": "Solomon Islands"
  }, 
  {
    "available_places": 1, 
    "id": 163, 
    "name": "Somalia"
  }, 
  {
    "available_places": 1, 
    "id": 164, 
    "name": "South Africa"
  }, 
  {
    "available_places": 1, 
    "id": 165, 
    "name": "South Sudan"
  }, 
  {
    "available_places": 21, 
    "id": 166, 
    "name": "Spain"
  }, 
  {
    "available_places": 1, 
    "id": 167, 
    "name": "Sri Lanka"
  }, 
  {
    "available_places": 1, 
    "id": 168, 
    "name": "Sudan"
  }, 
  {
    "available_places": 1, 
    "id": 169, 
    "name": "Summer Olympics 2020"
  }, 
  {
    "available_places": 1, 
    "id": 170, 
    "name": "Suriname"
  }, 
  {
    "available_places": 22, 
    "id": 171, 
    "name": "Sweden"
  }, 
  {
    "available_places": 1, 
    "id": 172, 
    "name": "Switzerland"
  }, 
  {
    "available_places": 1, 
    "id": 173, 
    "name": "Syria"
  }, 
  {
    "available_places": 1, 
    "id": 174, 
    "name": "Taiwan*"
  }, 
  {
    "available_places": 1, 
    "id": 175, 
    "name": "Tajikistan"
  }, 
  {
    "available_places": 1, 
    "id": 176, 
    "name": "Tanzania"
  }, 
  {
    "available_places": 1, 
    "id": 177, 
    "name": "Thailand"
  }, 
  {
    "available_places": 1, 
    "id": 178, 
    "name": "Timor-Leste"
  }, 
  {
    "available_places": 1, 
    "id": 179, 
    "name": "Togo"
  }, 
  {
    "available_places": 1, 
    "id": 180, 
    "name": "Tonga"
  }, 
  {
    "available_places": 1, 
    "id": 181, 
    "name": "Trinidad and Tobago"
  }, 
  {
    "available_places": 1, 
    "id": 182, 
    "name": "Tunisia"
  }, 
  {
    "available_places": 1, 
    "id": 183, 
    "name": "Turkey"
  }, 
  {
    "available_places": 60, 
    "id": 184, 
    "name": "US"
  }, 
  {
    "available_places": 1, 
    "id": 185, 
    "name": "Uganda"
  }, 
  {
    "available_places": 28, 
    "id": 186, 
    "name": "Ukraine"
  }, 
  {
    "available_places": 1, 
    "id": 187, 
    "name": "United Arab Emirates"
  }, 
  {
    "available_places": 19, 
    "id": 188, 
    "name": "United Kingdom"
  }, 
  {
    "available_places": 1, 
    "id": 189, 
    "name": "Uruguay"
  }, 
  {
    "available_places": 1, 
    "id": 190, 
    "name": "Uzbekistan"
  }, 
  {
    "available_places": 1, 
    "id": 191, 
    "name": "Vanuatu"
  }, 
  {
    "available_places": 1, 
    "id": 192, 
    "name": "Venezuela"
  }, 
  {
    "available_places": 1, 
    "id": 193, 
    "name": "Vietnam"
  }, 
  {
    "available_places": 1, 
    "id": 194, 
    "name": "West Bank and Gaza"
  }, 
  {
    "available_places": 1, 
    "id": 195, 
    "name": "Winter Olympics 2022"
  }, 
  {
    "available_places": 1, 
    "id": 196, 
    "name": "Yemen"
  }, 
  {
    "available_places": 1, 
    "id": 197, 
    "name": "Zambia"
  }, 
  {
    "available_places": 1, 
    "id": 198, 
    "name": "Zimbabwe"
  }, 
  {
    "available_places": 1, 
    "id": 199, 
    "name": "Global"
  }
]

const Dropdown = () => {
    const [selectedCountry, setTasks] = useState()
  return (
    <div>Dropdown</div>
  )
}

export default Dropdown