<!DOCTYPE html>
<html>
<head>
    <title>Message Icon</title>
    <style>
        #message-icon {
            position: fixed;
            bottom: 50px;
            right: 40px;
            background-color: #007bff;
            color: white;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 5px;
            text-align: left;
            float:right;
        }
.modal-content .close {
    position: absolute; /* Use absolute positioning */
    top: 0; /* Align to the top of the page */
    right: 0; 
    cursor: pointer; 
    padding: 10px; 
}
    </style>
</head>
<body>
    <div id="message-icon" onclick="showModal()"><img src="${pageContext.request.contextPath}/images/FAQ.jpg" alt="FAQ" width="60" height="70"></div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>FAQ</h2>
           <b>How do I initiate a claim?</b>
            <details>
                <summary>Click to see the answer</summary>
                <p>To start a claim, ensure that all information is complete and accurate. Select your existing member data from the database and provide the reason for the claim. The claim request date should be the current date.</p>
            </details><br>
            <b>How is the claim amount determined for vehicle insurance?</b>
            <details>
                <summary>Click to see the answer</summary>
                <table border="1">
  <tr>
    <th>Reason for Claim</th>
    <th>Claim Amount</th>
  </tr>
  <tr>
    <td>Repair Claim</td>
    <td>40% of the total claim amount</td>
  </tr>
  <tr>
    <td>Stolen Claim</td>
    <td>70% of the total claim amount</td>
  </tr>
</table>
            </details><br>
            <b>What factors affect the claim amount for home insurance?</b>
            <details>
                <summary>Click to see the answer</summary>
                <table border="1">
  <tr>
    <th>Reason for Claim</th>
    <th>Claim Amount</th>
  </tr>
  <tr>
    <td>Renovate Claim</td>
    <td>50% of the total claim amount</td>
  </tr>
  <tr>
    <td>Destroyed Claim</td>
    <td>70% of the total claim amount</td>
  </tr>
</table>
            </details><br>
            <b>How does life insurance impact the final claim amount?</b>
            <details>
                <summary>Click to see the answer</summary>
                <table border="1">
  <tr>
    <th>Reason for Claim</th>
    <th>Claim Amount</th>
  </tr>
  <tr>
    <td>Treatment Claim</td>
    <td>Full amount after a 5% tax deduction</td>
  </tr>
  <tr>
    <td>Death Claim</td>
    <td>Full amount without any deduction</td>
  </tr>
</table>
            </details><br>
            <b>What happens after the claim is submitted?</b>
            <details>
                <summary>Click to see the answer</summary>
                <p>After submitting the claim, the process date will be calculated by adding 45 days to the current date. This date will be displayed to the user along with a success message.</p>
            </details>
            
            
        </div>
        

            
        </div>
    
    <script>
        function showModal() {
            document.getElementById("myModal").style.display = "block";
        }
 
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }
 
        window.onclick = function(event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }
    </script>
</body>
</html>