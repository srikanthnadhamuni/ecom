import React, { useEffect, useState } from 'react'; // Importing necessary modules from React
import axios from 'axios'; // Importing axios for making HTTP requests

function ProductList() {
    const [products, setProducts] = useState([]); // Initializing state variable 'products' as an empty array

    useEffect(() => {
        // useEffect hook is used to perform side effects in functional components
        // In this case, it is used to fetch the product data from the server

        axios.get('http://localhost:7855/products/all') // Making a GET request to the specified URL
            .then(response => {
                setProducts(response.data); // Updating the 'products' state with the data received from the server
            });
    }, []); // The empty dependency array ensures that the effect runs only once, similar to componentDidMount in class components

    return (
        <div>
            {products.map(product => (
                // Rendering each product in the 'products' array as a div element
                <div key={product.id}>
                    <h2>{product.name}</h2>
                    <p>{product.description}</p>
                    <p>Price: {product.price}</p> // Displaying the product price
                    <p>Category: {product.category}</p> // Displaying the product category
                    <p>Rating: {product.rating}</p> // Displaying the product rating
                </div>
            ))}
            </div>
    )
}

export default ProductList; // Exporting the ProductList component as the default export