// The ProductList component displays a list of products fetched from the server. Each product is displayed as a card with an image, name, price, and quantity. When a user clicks on a product card, they are redirected to the product details page using the navigate function from the react-router-dom library.
// The component fetches the product data from the server using the fetch API and displays it in the component. The product cards are generated dynamically using the map function to iterate over the list of products.
// The selectedId state variable is used to keep track of the currently selected product ID. When a user clicks on a product card, the selectedId is updated with the product ID, and the card is highlighted using conditional styling.
// The navigate function is used to redirect the user to the product details page when a product card is clicked. The product ID is passed as a URL parameter to the product details page.
// The formatName function is used to format the product name by capitalizing the first letter of each word.
// The ListGroup component takes a heading prop to display the title of the product list.
// The ProductList component is used in the App component to display the list of products on the products page.

import React, { useEffect, useState } from "react";
import "./ProductList.css"; // Import your CSS file
import { useNavigate } from "react-router-dom";
import formatName from "../uitils/formatProductName";

interface Props {
  heading: string;
}

interface Product {
  id: number;
  asin: string;
  name: string;
  description: string;
  price: number;
  quantity: number;
  image: string;
}

function ListGroup({ heading }: Props) {
  const [products, setProducts] = useState<Product[]>([]);
  const [selectedId, setSelectedId] = useState<number>();

  useEffect(() => {
    fetch("http://localhost:7855/products/all")
      .then((response) => response.json())
      .then((data) => setProducts(data))
      .catch((error) => console.error("Error:", error));
  }, []);
  console.log(selectedId);
  console.log(products);
  const navigate = useNavigate(); // to reddirect to /products/id
  return (
    <div className="p-5 d-flex flex-column  align-items-center">
      <h1>{heading}</h1>
      <div className="container gap-2">
        <div className="row">
          {products.map((product) => (
            <div
              key={product.id}
              className={`col-sm card-container list-group-item p-2`}
              onClick={() => setSelectedId(product.id)}
            >
              <div className="card">
                <img
                  // Construct the image URL from Amazon asin number format
                  src={product.image + product.asin + ".01._SCMZZZZZZZ_.jpg"}
                  className="card-img-top"
                  alt={product.name}
                />
                <div className="card-body">
                  <p
                    className={`card-title ${
                      product.id === selectedId ? "active" : ""
                    }`}
                  >
                    {formatName(product.name)}
                  </p>
                  {/* <p className="card-text">{product.description}</p> */}
                  <p className="card-text">
                    <strong>Price:</strong> ${product.price}
                  </p>
                  <p className="card-text">
                    <strong>Quantity:</strong> {product.quantity}
                  </p>
                  <button
                    className="view-button"
                    onClick={() => navigate(`/products/${product.id}`)}
                  >
                    View Product
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default ListGroup;
