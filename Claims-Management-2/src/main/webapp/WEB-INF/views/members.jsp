<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header3.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-table2excel/1.1.0/jquery.table2excel.min.js"></script>

 <style>
      
  button {
background-color: #04AA6D; 
border: none;
color: white;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 20px;
outline: 1px dotted;
outline: 5px auto -webkit-focus-ring-color;
font-size:15px;
}
    </style>
	<div style="display: flex; justify-content: center; align-items: center;">
  <h4 class="p-2" style="margin-left: 550px;">All Members List</h4>
  <button onclick="downloadTableData()" class="import" style="margin-left:230px;">Download as Excel</button>
  <button onclick="window.print()" style="margin-left: 30px;">Print</button></div>
</div>

	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered" id ="tableData" >
		<thead class="table-dark">
			<tr>
				<th>Member ID</th>
				<th>Full Name</th>
				<th>Address</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>Insurance Type</th>
				<th>Insurance Amt.</th>
				<th>Max Claim. Amt.</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.memberid }</td>
				<td>${m.fname } ${m.lname }</td>
				<td>${m.address }</td>
				<td>${m.email }</td>
				<td>${m.gender }</td>
				<td>${m.phone }</td>
				<td>${m.insurance_type }</td>
				<td>${m.insurance_amount }</td>
				<td>${m.max_claim_amount }</td>
				<td><a href="/update?member_id=${m.memberid}" class="btn btn-primary btn-sm">Update</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

    <script>
        function downloadTableData() {
            const table = document.getElementById('tableData');
            const rows = table.querySelectorAll('tr');
            let csv = [];

            for (let i = 0; i < rows.length; i++) {
                const row = [], cols = rows[i].querySelectorAll('td, th');

                for (let j = 0; j < cols.length; j++) {
                    row.push(cols[j].innerText);
                }

                csv.push(row.join(','));
            }

            const csvContent = 'data:text/csv;charset=utf-8,' + csv.join('\n');
            const encodedUri = encodeURI(csvContent);
            const link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'table_data.csv');
            document.body.appendChild(link); // Required for Firefox
            link.click();
        }
    </script>


	
	
<jsp:include page="footer.jsp"></jsp:include>