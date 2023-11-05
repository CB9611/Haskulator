// script.js
document.getElementById("calculate-button").addEventListener("click", function () {
    const initialVelocity = parseFloat(document.getElementById("initial-velocity").value);
    const acceleration = parseFloat(document.getElementById("acceleration").value);
    const time = parseFloat(document.getElementById("time").value);
  
    fetch("/calculate-velocity", {
      method: "POST",
      body: JSON.stringify({ initialVelocity, acceleration, time }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        document.getElementById("result").textContent = "The velocity (v) is: " + data.velocity;
      });
  });
  