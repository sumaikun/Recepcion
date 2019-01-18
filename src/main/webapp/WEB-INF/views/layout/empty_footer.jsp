<style>
	.loader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 120px;
    height: 120px;
    animation: spin 2s linear infinite;
	}
	
	@keyframes spin {
	    0% { transform: rotate(0deg); }
	    100% { transform: rotate(360deg); }
	}

</style>

<div class="loader" style="display:none"></div>

<script>
window.onbeforeunload = function(e) {
	  console.log("triggered");
	  $(".loader").show();
};

</script>
<!-- Footer -->
<footer class="text-center" style="margin-top:100% important;">
    <div class="footer-above">
        <div class="container">
            <div class="row">
                <div class="footer-col col-md-4">
                   
                </div>
                <div class="footer-col col-md-4" >
                     <h3>Dirección</h3>
                    <p>Cr 69 b No 98 a -10
                        <br>Morato</p>
                </div>
                <div class="footer-col col-md-4">
                    
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy; AOA COLOMBIA 2017
                </div>
            </div>
        </div>
    </div>
</footer>
