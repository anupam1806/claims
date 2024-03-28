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
<jsp:include page="header.jsp"></jsp:include>
	<center><h2 class="p-2" >Update Member Information</h2></center>
	<div class="">
		<div class="container-fluid">
			<form method="post">
			<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Member Id</label>
					<div class="col-sm-8">
						<input type="text" name="memberid" value="${member.memberid }" readonly class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="row">
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" name="fname" value="${member.fname }" required class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" name="lname" value="${member.lname }" required class="form-control" pattern="[A-Za-z]{3,15}">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8">
						<input type="date" name="dob" value="${member.dob }" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Address</label>
					<div class="col-sm-8">
						<input type="text" name="address" value="${member.address }" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Contact Number</label>
					<div class="col-sm-8">
						<input type="text" name="phone" value="${member.phone }" maxlength="10" required class="form-control" pattern="[0-9]{10,10}">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Email Id</label>
					<div class="col-sm-8">
						<input type="email" name="email" value="${member.email }" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
    <label class="col-sm-4 col-form-label">Gender</label>
    <div class="col-sm-8">
        <div class="form-check form-check-inline">
            <input type="radio" id="maleRadio" name="gender" value="male" class="form-check-input" ${member.gender eq 'Male' ? 'checked':'' }>
            <label for="maleRadio" class="form-check-label">Male</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" id="femaleRadio" name="gender" value="female" class="form-check-input" ${member.gender eq 'Female' ? 'checked':'' }>
            <label for="femaleRadio" class="form-check-label">Female</label>
        </div>
    </div>
</div>

				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Nominee Count</label>
					<div class="col-sm-8">
						<select name="nominee_count" required class="form-control">	
							<option ${member.nominee_count eq '1' ? 'selected':'' }>1</option>
							<option ${member.nominee_count eq '2' ? 'selected':'' }>2</option>
							<option ${member.nominee_count eq '3' ? 'selected':'' }>3</option>
						</select>
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Insurance Type</label>
					<div class="col-sm-8">
						<input type="text" name="insurance_type" readonly value="${member.insurance_type }" class="form-control">
					</div>
				</div>
				<input type="hidden" id="ins_type" name="insurance_type">
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Insurance Amount</label>
					<div class="col-sm-8">
						<input type="number" id="ins_amount" name="insurance_amount" readonly  value="${member.insurance_amount }" class="form-control">
					</div>
				</div>
				<div class="form-row form-group col-5">
					<label class="col-sm-4 col-form-label">Max Claimable Amount</label>
					<div class="col-sm-8">
						<input type="number" id="max_amount" name="max_claim_amount" readonly  value="${member.max_claim_amount }" class="form-control">
					</div>
				</div></div>
				<div style="position: absolute; top: 70; right: 50;">
				<button class="btn btn-primary btn-sm float-right mr-3">Update Member</button>
				<a href="members.jsp"></a>
				</div>
				
			</form>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
