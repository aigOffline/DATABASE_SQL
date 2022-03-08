import React from "react";
//import { BrowserRouter as Router, Switch } from "react-router-dom";
import { BrowserRouter as Routes, Route } from "react-router-dom";
import Home from "./routes/Home";
import UpdatePage from "./routes/UpdatePage";
import RestaurantDetailPage from "./routes/RestaurantDetailPage";
import { RestaurantsContextProvider } from "./context/RestaurantsContext";


const App =()=> {
    return (
    <RestaurantsContextProvider> 
     <div className = "container"> 
         <Routes>
    
         <Route exact path="/" component={Home} />
            <Route
              exact
              path="/restaurants/:id/update"
              component={UpdatePage}
            />
            <Route
              exact
              path="/restaurants/:id"
              component={RestaurantDetailPage}
            />
            </Routes>
            </div>
            </RestaurantsContextProvider>
  
    )}
export default App;