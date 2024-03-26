import { useNavigate } from "react-router";

function HomePage() {
  const navigate = useNavigate();
  return (
    <div
      style={{ height: "80vh" }}
      className="d-flex flex-column justify-content-center align-items-center"
    >
      <h1 className="text-[red]">Welcome to our E-commerce Store</h1>
      <p>Explore our wide range of products.</p>
      <button onClick={() => navigate("/products/all")}>View Products</button>
    </div>
  );
}

export default HomePage;
