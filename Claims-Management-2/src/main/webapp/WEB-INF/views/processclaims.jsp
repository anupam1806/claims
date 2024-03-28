<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group{
	padding:0px;
	margin:8px!important;
}
</style>
<jsp:include page="header6.jsp"></jsp:include>
	<center><h2 class="p-2" >Claim Process</h2></center>
	<div class="row">
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
	</div>
	<c:if test="${found }">
	<div class="row">
		<div class="col-sm-6 mx-auto">
			<form method="post" enctype="multipart/form-data">
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
						<input type="date" readonly name="req_date" value="${claim.req_date }" class="form-control">
					</div>
				</div>
				<input type="hidden" name="id" value="${claim.id}">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Claim Reason</label>
					<div class="col-sm-8">
						<input type="text" id="maxamount" readonly value="${claim.reason }" class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Final Claim Amount</label>
					<div class="col-sm-8">
						<input type="number" readonly value="${claim.final_amount }" name="final_amount" required class="form-control">
					</div>
				</div>
				
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Process Response</label>
					<div class="col-sm-8">
						<select name="status" id="status" required class="form-control">
							<option value="">Select Status</option>
							<option value="Approved">Approve</option>
							<option value="Rejected">Reject</option>
						</select>
					</div>
				</div>
				<div id="docs" style="display:none">
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Document 1</label>
						<div class="col-sm-8">
							<input type="file" name="doc1" id="doc1" class="form-control">
						</div>
					</div>
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Document 2</label>
						<div class="col-sm-8">
							<input type="file" name="doc2" id="doc2" class="form-control">
						</div>
					</div>
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Document 3</label>
						<div class="col-sm-8">
							<input type="file" name="doc3" id="doc3" class="form-control">
						</div>
					</div>
				</div>
				<div  id="reason" style="display:none">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Reject Reason</label>
					<div class="col-sm-8">
						<input type="text" name="rej_reason" id="rej_reason" class="form-control">
					</div>
				</div>
				</div>
				
				<button class="btn btn-primary float-right mr-3">Submit Claim</button>
			</form>
		</div>
	</div>
	</c:if>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(function(){
	$("#status").change(function(){
		let status=$(this).val();
		console.log(status)
		if(status==="Rejected"){
			$("#reason").css({"display":"block"})
			$("#docs").css({"display":"none"})
			$("#rej_reason").prop("required",true);
			$("#doc1").prop("required",false);
			$("#doc2").prop("required",false);
			$("#doc3").prop("required",false);
		}else if(status==="Approved"){
			$("#reason").css({"display":"none"})
			$("#docs").css({"display":"block"})
			$("#rej_reason").prop("required",false);
			$("#doc1").prop("required",true);
			$("#doc2").prop("required",true);
			$("#doc3").prop("required",true);
		} else{
			$("#reason").css({"display":"none"})
			$("#docs").css({"display":"none"})
		}
	})
});
</script>