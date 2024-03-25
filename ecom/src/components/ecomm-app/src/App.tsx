import { BrowserRouter, Route, Routes } from "react-router-dom";
import ProductList from "./components/ProductList";
import Product from "./components/Product";
import Header from "./components/Header";
import HomePage from "./components/Homepage";

function App() {
  return (
    <BrowserRouter>
      <Header />

      <div className="p-1">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route
            path="/products/all"
            element={<ProductList heading="Product List" />}
          />
          <Route path="/products/:id" element={<Product />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
