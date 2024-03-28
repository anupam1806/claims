<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header2.jsp"></jsp:include>
	<center><h2 class="p-2">Search Claims</h2></center>
	
	<div class="row">
		<div class="col-sm-10 mx-auto">
		<form onsubmit="return validate(this)">
			<div class="row">
				<div class="col-sm-3">
				<div class="form-group">
					<input type="text" value="${dto.memberid }" placeholder="Enter Member Id" 
					class="form-control" name="memberid">
				</div>
				</div>
				<div class="col-sm-3">
				<div class="form-group">
					<input type="text" value="${dto.mname }" placeholder="Enter Member Name" 
					class="form-control" name="mname">
				</div>
				</div>
				<div class="col-sm-5">
				<div class="form-group form-row">
					<input type="date" value="${dto.from }" class="form-control col-sm-6" name="from">
					<input type="date" value="${dto.to }" class="form-control col-sm-6" name="to">
				</div>
				</div>				
				<div class="col-sm-1">
					<button name="search" class="btn btn-primary"><i class="fas fa-search fa" style="color:#ffffff;"></i></button>
					<button onclick="downloadTableData()" class="3import" style="position:absolute; top:-50px; right:110px; width:147px;">Download as Excel</button>
				</div>
			</div>
		</form>
		
		<c:if test="${error ne null }">
			<div class="alert alert-danger text-center">
				${error }
			</div>			
		</c:if>
		<c:if test="${found eq false and param.search ne null }">
			<div class="alert alert-danger text-center font-weight-bold">
				Record not found.
			</div>
		</c:if>
		</div>
	</div>
	<table id="tableData" class="table table-bordered">
		<thead class="table-dark">
			<tr>
				<th>ID</th>
				<th>Member Id</th>
				<th>Member Name</th>
				<th>Request Date</th>
				<th>Process Date</th>
				<th>Claim Amount</th>
				<th>Reason</th>
				
				
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
    <tr>
        <td>${m.id }</td>
        <td>${m.memberid }</td>
        <td>${m.fname } ${m.lname }</td>
        <td>${m.req_date }</td>
        <td>${m.process_date }</td>
        <td>${m.final_amount }</td>
        <td>${m.reason }</td>
        <c:choose>
            <c:when test="${m.status eq 'Approved'}">
                <td style="color: green;">
            </c:when>
            <c:when test="${m.status eq 'Rejected'}">
                <td style="color: red;">
            </c:when>
            <c:otherwise>
                <td style="color: #Ffbf00;">
            </c:otherwise>
        </c:choose>
            ${m.status }
            <c:if test="${m.status eq 'Rejected' }">
                <div style="font-color:black;">${m.rej_reason }</div>
            </c:if>
        </td>
    </tr>
</c:forEach>
		</tbody>
	</table>
	<script>
	function validate(f){
		let memberid=f.memberid.value;
		let mname=f.mname.value;
		let from=f.from.value;
		let to=f.to.value;
		
		if(memberid==="" && mname==="" && from ==="" && to===""){
			alert("Atleast one field must be provided")
			return false;
		}else{
			return true;
		}
	}
	
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
        link.setAttribute('download', 'claims_data.csv');
        document.body.appendChild(link); // Required for Firefox
        link.click();
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>