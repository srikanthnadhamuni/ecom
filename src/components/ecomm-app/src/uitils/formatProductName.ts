// Code to format product name
// The formatName function takes a product name as input and returns a formatted version of the name. If the name is longer than 10 characters, it truncates the name and adds an ellipsis (...) at the end. This function is used in the ProductList component to display the product names in a more compact format.
export default function formatName(name: string) {
    if (name.length > 10) {
      return name.slice(0, 20) + '...';
    }
    return name;
  }