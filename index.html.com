<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tatkal Ticket Booking</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 500px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px #ccc;
    }

    input, select, button {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      box-sizing: border-box;
    }

    button {
      background-color: #007bff;
      color: white;
      border: none;
      font-size: 16px;
      cursor: pointer;
      border-radius: 5px;
    }

    h2 {
      text-align: center;
    }

    #response {
      margin-top: 15px;
      font-weight: bold;
      color: green;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>IRCTC Tatkal Ticket Booking</h2>
    <form id="tatkalForm">
      <label>IRCTC Username:</label>
      <input type="text" id="username" placeholder="Enter IRCTC ID" required />

      <label>Password:</label>
      <input type="password" id="password" placeholder="Enter Password" required />

      <label>From Station:</label>
      <input type="text" id="fromStation" required />

      <label>To Station:</label>
      <input type="text" id="toStation" required />

      <label>Date:</label>
      <input type="date" id="journeyDate" required />

      <label>Class:</label>
      <select id="class">
        <option value="SL">Sleeper (SL)</option>
        <option value="3A">AC 3 Tier (3A)</option>
        <option value="2A">AC 2 Tier (2A)</option>
      </select>

      <label>Quota:</label>
      <select id="quota">
        <option value="TQ">Tatkal (TQ)</option>
      </select>

      <label>Passenger Name:</label>
      <input type="text" id="passengerName" required />

      <label>Age:</label>
      <input type="number" id="age" required />

      <label>Gender:</label>
      <select id="gender">
        <option value="M">Male</option>
        <option value="F">Female</option>
      </select>

      <button type="submit">Book Ticket</button>
    </form>

    <div id="response"></div>
  </div>

  <script>
    document.getElementById('tatkalForm').addEventListener('submit', function (e) {
      e.preventDefault();

      const username = document.getElementById('username').value;
      const from = document.getElementById('fromStation').value;
      const to = document.getElementById('toStation').value;
      const date = document.getElementById('journeyDate').value;
      const name = document.getElementById('passengerName').value;

      // Display mock response
      document.getElementById('response').innerText =
        `✔️ Ticket request submitted for ${name} from ${from} to ${to} on ${date} (IRCTC ID: ${username}) - Demo only.`;
    });
  </script>
</body>
</html>
