<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header2.jsp"></jsp:include>
	<center><h2 class="p-2">My Claims</h2></center>
	
	<div class="row">
		<div class="col-sm-10 mx-auto">
		
		<c:if test="${found eq false}">
			<div class="alert alert-danger text-center font-weight-bold">
				Record not found.
			</div>
		</c:if>
		</div>
	</div>
	<table class="table table-bordered">
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
				
				
				<td>
				${m.status }
				<c:if test="${m.status eq 'Rejected' }">
					<div class="text-danger font-weight-bold">${m.rej_reason }</div>
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
	</script>
<jsp:include page="footer.jsp"></jsp:include>