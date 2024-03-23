import { useState } from "react";
interface Props {
  heading: string;
}
function ListGroup({ items, heading }: Props) {
  const [selectedIndex, setSelectedIndex] = useState(-1);

  useEffect(() => {
    fetch("http://localhost:7855/products/all")
      .then((response) => response.json())
      .then((data) => setProducts(data))
      .catch((error) => console.error("Error:", error));
  }, []);
  console.log(selectedId);
  console.log(products);
  return (
    <>
      <h1>{heading}</h1>
      {items.length === 0 && <p>No items found</p>}
      <ul className="list-group">
        {items.map((item, index) => (
          <li
            className={
              selectedIndex === index
                ? "list-group-item active"
                : "list-group-item"
            }
            key={item}
            onClick={() => {
              setSelectedIndex(index);
            }}
          >
            {item}
          </li>
        ))}
      </div>
    </>
  );
}

export default ListGroup;
