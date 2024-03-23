import React, { useEffect, useState } from "react";
import "./ListGroup.css"; // Import your CSS file

interface Props {
  heading: string;
}

interface Product {
  id: number;
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

  return (
    <>
      <h1>{heading}</h1>
      <div className="row">
        {products.map((product) => (
          <div
            key={product.id}
            className={`col-sm-4 card-container list-group-item ${
              product.id === selectedId ? "active" : ""
            }`}
            onClick={() => setSelectedId(product.id)}
          >
            <div className="card">
              <img
                src={product.image}
                className="card-img-top"
                alt={product.name}
              />
              <div className="card-body">
                <li
                  className={`card-title ${
                    product.id === selectedId ? "active" : ""
                  }`}
                >
                  {product.name}
                </li>
                <p className="card-text">{product.description}</p>
                <p className="card-text">
                  <strong>Price:</strong> ${product.price}
                </p>
                <p className="card-text">
                  <strong>Quantity:</strong> {product.quantity}
                </p>
              </div>
            </div>
          </div>
        ))}
      </div>
    </>
  );
}

export default ListGroup;
