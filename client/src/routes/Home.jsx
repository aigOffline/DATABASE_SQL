
   
import React from "react";
import Header from "../components/Header";
import AddRestaurant from "../components/AddRestaurant";
import RestaurantList from "../components/RestaurantList";
import DisplayImage from "../components/DisplayImage";
const Home = () => {
  return (
    <div>
      <Header />
    
      <AddRestaurant />
      <RestaurantList />
      
    </div>
  );
};

export default Home;
