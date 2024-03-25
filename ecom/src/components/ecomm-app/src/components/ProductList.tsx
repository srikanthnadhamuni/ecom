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
                  //src={product.image}
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
