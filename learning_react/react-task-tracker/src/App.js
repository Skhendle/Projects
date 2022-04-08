

function App() {
  const x = Math.floor(Math.random()*10);
  return (
    <div className="container">
      <h1>Hello From React</h1>
      <h2>Do you think this journey will be worth a while? {x%2===0? 'No': 'Yes'}</h2>
      
    </div>
  );
}

export default App;
