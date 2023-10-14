import './App.css';
import Description from "./components/Description/Description.js";

function App() {
  return (
    <div className="haskulator-container">
      <h1 className="title-header"> Haskulator </h1>
      <div className="description">
        <Description />
      </div>
      <div className="body-container">
        <div className="body-content">
          <h3 className="options-header">🔮 Please select an option:</h3>
          <form>
            <label htmlFor="options">Choose an option:</label>
            <select id="options" className="select-options">
              <option value="example1">Example 1</option>
              <option value="example2">Example 2</option>
              <option value="example3">Example 3</option>
              <option value="example4">Example 4</option>
              <option value="example5">Example 5</option>
            </select>
            <button type="submit" className="submit-button">Submit 🚀</button>
          </form>
        </div>
      </div>
    </div>
  );
}

export default App;
