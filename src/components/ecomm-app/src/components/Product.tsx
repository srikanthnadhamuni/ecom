// Product.tsx is a component that displays a single product. It fetches the product data from the server using the product ID provided in the URL. The product data is then displayed in a card format, showing the product image, name, description, price, and quantity. There is also a "Buy Product" button that can be clicked to purchase the product.
// The component uses the useParams hook from react-router-dom to access the product ID from the URL. It then fetches the product data using this ID and displays it in the component.

import React, { useEffect, useState } from "react"; //useState is a Hook that allows you to have state variables in functional components
// useEffect is a Hook that lets you perform side effects in function components
import { useParams } from "react-router-dom"; // useParams is a hook that allows you to access the URL parameters

// What is an interface in TypeScript?
// An interface is a way to define a contract in your code. This contract includes the properties and methods that a class must implement. TypeScript uses interfaces to type-check that an object meets the requirements of a specific contract.
interface Product {
  // Define the Product interface
  id: number;
  asin: string;
  name: string;
  description: string;
  price: number;
  quantity: number;
  image: string;
}

const Product = () => {
  // Define the Product component
  const { id } = useParams(); // Get the product ID from the URL
  const [product, setProduct] = useState<Product | null>(null); // State to store the product data

  useEffect(() => {
    //
    const fetchProduct = async () => {
      try {
        const response = await fetch(`http://localhost:7855/products/${id}`); // Fetch the product data using the product ID
        const data = await response.json(); // Parse the response as JSON
        setProduct(data); // Set the product data in the state
      } catch (error) {
        console.error("Error fetching product:", error);
      }
    };

    fetchProduct(); // Call the fetchProduct function
  }, [id]);

  if (!product) {
    return <div>Loading...</div>;
  }

  return (
    // Return the JSX to render the product details
    <div
      className="d-flex justify-content-center align-items-center"
      style={{ height: "80vh" }}
    >
      <div className="row">
        <div className="col-sm-12 col-md-6">
          <img
            src={product.image + product.asin + ".01._SCLZZZZZZZ_.jpg"}
            className="img-fluid"
            alt={product.name}
          />
        </div>
        <div className="col-sm-12 col-md-6">
          <h2>{product.name}</h2>
          <p>{product.description}</p>
          <p>Price: ${product.price}</p>
          <p>Quantity: {product.quantity}</p>
          <button className="btn btn-primary">Buy Product</button>
        </div>
      </div>
    </div>
  );
};

export default Product; // Export the Product component
