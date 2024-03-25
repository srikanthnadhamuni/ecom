import React, { useEffect, useState } from "react";
import "./ProductList.css"; // Import your CSS file
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
    // Fetch the product data using the id from the URL
    // Replace this with your actual API call or data retrieval logic
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
    <div>
      <img
        src={product.image + product.asin + ".01._SCMZZZZZZZ_.jpg"}
        className=".card-img-top"
        alt={product.name}
        // style={{ width: "200px", height: "200px" }}
      />
      <h2>{product.name}</h2>
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <button className="btn btn-primary">Buy Product</button>
    </div>
  );
};

export default Product;
