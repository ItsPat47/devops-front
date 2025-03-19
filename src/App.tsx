import './App.css';
import {useEffect, useState} from "react"


function App(){
  const [data, setData] = useState(null)

  useEffect(() => {
    const API_URL = process.env.REACT_APP_API_URL || "http://localhost:8000"; //recupérer url depuis .env
    fetch(`${API_URL}/api/data`)
    .then(response => response.json())
    .then(data => setData(data.message))
    .catch(error => console.error("Erreur API:", error));
  }, []);

  return (
    <div>
      <h1>Front React connecté à FastAPI</h1>
      <p>Donnée du backend : {data}</p>
    </div>
  );
}


export default App;
