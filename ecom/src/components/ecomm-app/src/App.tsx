import ListGroup from "./components/ListGroup";
import "./App.css";

function App() {
  let items = ["New York", "San Francisco", "Los Angeles", "Chicago"];

  return (
    <div>
      <ListGroup heading={"Cities"} />
    </div>
  );
}

export default App;
