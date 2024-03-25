import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

interface Product {
  id: number;
  asin: string;
  name: string;
  description: string;
  price: number;
  quantity: number;
  image: string;
}

const Product = () => {
  const { id } = useParams();
  const [product, setProduct] = useState<Product | null>(null);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await fetch(`http://localhost:7855/products/${id}`);
        const data = await response.json();
        setProduct(data);
      } catch (error) {
        console.error("Error fetching product:", error);
      }
    };

    fetchProduct();
  }, [id]);

  if (!product) {
    return <div>Loading...</div>;
  }

  return (
    <div
      className="d-flex justify-content-center align-items-center"
      style={{ height: "80vh" }}
    >
      <div className="row">
        <div className="col-sm-12 col-md-6">
          <img
            src={product.image + product.asin + ".01._SCMZZZZZZZ_.jpg"}
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

export default Product;
