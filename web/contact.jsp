<%@include file="include/header.jsp" %>



	<!-- PATH SECTION ================================================= -->
    <section class="path">
        <div class="container">

            <div class="row">
                <ol>
                    <li><a href="index.html">home / </a></li>
                    <li><a href="contact.html"> contact us</a></li>
                </ol>
            </div>

        </div>
    </section>

	<!-- FORM SECTION ========================================= -->
	<section class="forma">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ">

					<div class="left-box">
						<h3>Please fill this form to contact with us</h3>
						<form method="POST" action="">
							<div class="row">
					  			<div class="col-md-6">
									<div class="form-group">
									    <input name="firstname" type="text" class="form-control" placeholder="First Name *"  />
									</div>
								</div>
									<div class="col-md-6">
									<div class="form-group">
									    <input name="lastname" type="text" class="form-control" placeholder="Last Name *"  />
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
									    <input name="email" type="text" class="form-control" placeholder="Your Email *"  />
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
									    <input name="subject" type="text" class="form-control" placeholder="Subject *"  />
									</div>
								</div>

					  			<div class="col-md-12">
									<div class="form-group">
									    <textarea name="message" class="form-control textareaa"  placeholder="Message *" ></textarea>
									</div>
								</div>
				 
								<div>
								 	<input name="submit" type="submit" class="btn" value="send request">
								</div>
				 			</div>
				    	</form>
					</div>

				</div>

				<div class="col-md-4">
					<div class="right-box">
						<h3>Contact information</h3>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod 
							tempor incidunt ut labore et dolore magna aliqua. Non equidem invideo miror magis.
						</p>

						<div class="ilainf">
							<ul>
								<li><i class="fa fa-bank"></i>4700 Egypt Menofia #175, Shebin,
                                    FL 32839, USA.</li>
								<li><i class="fa fa-phone"></i> Phone: 001 (407) 901-6400</li>
                                <li><i class="fa fa-print"></i> Fax: 001 (407) 901-6400</li>
                                <li><i class="fa fa-envelope-o"></i> Email: info@crunchpress.com</li>
                                <li><i class="fa fa-skype"></i> 001 (407) 901-6400</li>
                                <li><i class="fa fa-globe"></i> www.citezen.com</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- MAP SECTION ========================================= -->
	<div class="contact-mapa">
		<iframe  
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d110465.
			56322008088!2d31.246004820040344!3d30.09278725209322!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.
			1!3m3!1m2!1s0x145815edd80fc3d5%3A0x14ef64c031153db7!2sChild+center+of+civilization+and+creativity
			!5e0!3m2!1sen!2seg!4v1485893606805" width="100%" height="450" 
			frameborder="0" style="border:0" allowfullscreen>
		</iframe>
	</div>

<%@include file="include/footer.jsp" %>