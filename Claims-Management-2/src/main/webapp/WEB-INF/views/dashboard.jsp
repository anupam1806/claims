<jsp:include page="header1.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>


	<h3 class="p-2"  style="border-bottom:2px black ; text-align:center;font-family:algerian;">Welcome to Dashboard</h3>	

<div class="grid-container">

  <div class="grid-item">
    <div class="card border-0 transform-on-hover">
      <div class="card-body" style="background-image:url('/images/night.png'); color: #fff;">
        <i class="fas fa-users fa-4x"></i>
        <h6 class="card-title">Total Members</h6>
        <h3 class="card-text">${members}</h3>
      </div>
    </div>
  </div>

  <div class="grid-item">
    <div class="card border-0 transform-on-hover">
      <div class="card-body" style="background-image:url('/images/night.png');color: #fff;">
        <i class="fas fa-file-alt fa-4x"></i>
        <h6 class="card-title">Total Claims</h6>
        <h3 class="card-text">${claims}</h3>
      </div>
    </div>
  </div>
 
  <div class="grid-item">
    <div class="card border-0 transform-on-hover">
      <div class="card-body" style=" background-image:url('/images/night.png');  color: #fff;">
        <i class="fas fa-hourglass-half fa-4x"></i>
        <h6 class="card-title">Pending Claims</h6>
        <h3 class="card-text">${pendings}</h3>
      </div>
    </div>
  </div>
 
  <div class="grid-item">
    <div class="card border-0 transform-on-hover">
      <div class="card-body" style="background-image:url('/images/night.png'); color: #fff;">
        <i class="fas fa-check-circle fa-4x"></i>
        <h6 class="card-title">Approved Claims</h6>
        <h3 class="card-text">${approved}</h3>
      </div>
    </div>
  </div>
  
</div>
<center><canvas id="myChart" style="width:100%;max-width:600px"></canvas>
</center>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Total Members', 'Total Claims', 'Approved Claims', 'Pending Claims'],
        datasets: [{
            label: 'Count',
            data: [${members}, ${claims}, ${approved}, ${pendings}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

 
 
 
<jsp:include page="footer.jsp"></jsp:include>