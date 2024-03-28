<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group{
	padding:0px;
	margin:8px!important;
}
</style>
<jsp:include page="header4.jsp"></jsp:include>
<center><h2 class="p-2" >New Claim Request</h2></center>
	<div class="col-sm-4 mx-auto">
		<form class="input-group mb-3">
			<input type="text" name="member_id" required value="${memberid }" class="form-control" 
			placeholder="Enter member id">
			  <div class="input-group-append">
			    	<button class="btn btn-success" type="submit" id="button-addon2"><i class="fas fa-search fa" style="color:#ffffff;"></i></button>
			  </div>			
		  </form>
		  <c:if test="${msg ne null }">
		  	<div class="alert alert-danger">
		  		${msg }
		  	</div>
		  </c:if>
		</div>
	<div class="row">
		<div class="col-sm-6 mx-auto">
	<c:if test="${found }">
			<form method="post">
			<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Member Id</label>
					<div class="col-sm-8">
						<input type="text" name="memberid" value="${memberid }" readonly class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" value="${member.fname }" readonly class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" value="${member.lname }" readonly class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Nominee Count</label>
					<div class="col-sm-8">
						<input type="text" value="${member.nominee_count }" readonly class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Insurance Type</label>
					<div class="col-sm-8">
						<input type="text" readonly value="${member.insurance_type }" class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Claim Amount</label>
					<div class="col-sm-8">
						<input type="text" id="maxamount" readonly value="${member.max_claim_amount }" class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Request Date</label>
					<div class="col-sm-8">
						<input type="date" name="req_date" id="reqdate" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Claim Reason</label>
					<div class="col-sm-8">
						<select name="reason" id="reason" required class="form-control">
							<option value="">Select Reason</option>
							<c:forEach var="reason" items="${reasons }">
							<option>${reason }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Final Claim Amount</label>
					<div class="col-sm-8">
						<input type="number" readonly id="final" name="final_amount" required class="form-control">
					</div>
				</div>
				<button class="btn btn-primary float-right mr-3">Create Request</button>
			</form>
		</div>
	</div>
	</c:if>
<jsp:include page="footer.jsp"></jsp:include>
<script>
document.querySelector("#reqdate").valueAsDate=new Date();
$(function(){
	$("#reason").change(function(){
		let reason=$(this).val();
		let claimamt=$("#maxamount").val();
		let rate=0;
		switch(reason){
		case "Repair":
			rate=0.40;
			break;
		case "Stolen":
			rate=0.70;
			break;
		case "Renovate":
			rate=0.50;
			break;
		case "Destroyed":
			rate=0.70;
			break;
		case "Treatment Claim":
			rate=0.95;
			break;
		case "Death Claim":
			rate=1;
			break;
		}
		let claimamount=Math.ceil(claimamt*rate);
		$("#final").val(claimamount);
	})
});
</script>