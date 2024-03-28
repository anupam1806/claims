<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group{
	padding:0px;
	margin:8px!important;
}
.col-sm-4::after{
content:"*";
color:red;
}
</style>
<jsp:include page="header5.jsp"></jsp:include>
<jsp:include page="FAQ.jsp"></jsp:include>
<div>
	<center><h2 class="p-2" >New Member Registration</h2></center>
	
	</div>
	<div class="">
		<div class=" container-fluid">
		<c:if test="${msg ne null }">
			<div class="alert alert-success">
				${msg }
			</div>			
		</c:if>
		
			<form method="post">
			<div class="row">
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" name="fname" required class="form-control" pattern="[A-Za-z]{3,15}" placeholder="enter firstname">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" name="lname" required class="form-control" pattern="[A-Za-z]{3,15}" placeholder="enter lastname">
					</div>
				</div>
				<div class="form-row form-group col-5 ">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8">
						<input type="date" name="dob" id="dob" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Address</label>
					<div class="col-sm-8">
						<input type="text" name="address" required class="form-control" placeholder="enter address">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Contact Number</label>
					<div class="col-sm-8">
						<input type="tel" name="phone" maxlength="10" required class="form-control" pattern="[0-9]{10,10}" placeholder="enter phone number">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Email Id</label>
					<div class="col-sm-8">
						<input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" required class="form-control" placeholder="enter email">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" name="pwd" required class="form-control" placeholder="enter password">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Gender</label>
					<div class="col-sm-8">
				
						<input type="radio" id="male" name="gender" value="male" required>
						<label for="male">Male</label><br>
						<input type="radio" id="female" name="gender" value="female" required>
						<label for="female">Female</label><br>
						
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Nominee Count</label>
					<div class="col-sm-8">
						<select name="nominee_count" required class="form-control">	
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Insurance Type</label>
					<div class="col-sm-8">
						<select id="insurance_id" required class="form-control">	
							<option value="">Select Insurance Type</option>
							<c:forEach items="${insurances }" var="ins">
							<option value="${ins.id}">${ins.insurance_type }</option>
							</c:forEach>							
						</select>
					</div>
				</div>
				<input type="hidden" id="ins_type" name="insurance_type">
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Insurance Amount</label>
					<div class="col-sm-8">
						<input type="number" id="ins_amount" name="insurance_amount" readonly required class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Max Claimable Amount</label>
					<div class="col-sm-8">
						<input type="number" id="max_amount" name="max_claim_amount" readonly required class="form-control">
					</div>
				</div></div>
				<div style="position: absolute; top: 37; right:10;">
				<button class="btn btn-primary float-right mr-3">Save Member</button></div>
				<div style="position: absolute; top: 37; right:150;">
				<button input type="reset" class="btn btn-primary float-right mr-3">Reset</button></div>
			</form>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(function(){
	document.querySelector("#dob").max=new Date().toISOString().slice(0, -14);
	$("#insurance_id").change(function(){
		let id=$(this).val();
		$.ajax({
			type:'get',
			url:'/insurances/'+id,
			success:function(resp){
				console.log(resp)
				$("#ins_amount").val(resp.insurance_amount)
				$("#ins_type").val(resp.insurance_type)
				$("#max_amount").val(resp.max_claim_amount)				
			}
		});
	});
});
</script>