import React from "react";
import { Router } from "@reach/router";

import Sidebar from "./components/Sidebar/index";
import Navbar from "./components/Navbar/index";
import UserTable from "./components/UserTable/index";
import CategoryTable from "./components/CategoryTable/index";
import Home from "./components/Home/index";
import Login from "./components/Login/index";

function App() {
  const user = sessionStorage.getItem("user");
  if (user)
    return (
      <div className="d-flex" id="wrapper">
        <Sidebar />
        <div id="page-content-wrapper">
          <Navbar />
          <div className="container-fluid mt-3">
            <Router>
              <Home path="/" />
              <Login path="/login" />
              <UserTable path="user-table" />
              <CategoryTable path="category-table" />
            </Router>
          </div>
        </div>
      </div>
    );
  else
    return (
      <>
        <Router>
          <Login default />
        </Router>
      </>
    );
}

export default App;
