import './App.css';
import Description from "./components/Description/Description.js";

function App() {
  return (
    <div className="haskulator-container">
      <h1 className="title-header">Haskulator</h1>
      <div className="description">
        <Description />
      </div>
      <div className="body-container">
        <body className="body-content">
          <h3 className="options-header">Please select an option:</h3>
          <form>
            <select>
              <option type="radio">Example1</option>
              <option type="radio">Example2</option>
              <option type="radio">Example3</option>
              <option type="radio">Example4</option>
              <option type="radio">Example5</option>
            </select>
            <input type="submit" value="Submit" />
          </form>
        </body>
      </div>
    </div>
  );
}

export default App;
