 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
  <br>
<br>
<br>
<br>
<br>
 
 <script type="text/javascript" src="<c:url value="/resources/theme1/js/scanner.js"/>" ></script>

 <div class="wrapper">
 	<script>
 		    //
        // Please read scanner.js developer's guide at: http://asprise.com/document-scan-upload-image-browser/ie-chrome-firefox-scanner-docs.html
        //
        /** Initiates a scan */
        function scanToJpg() {
            scanner.scan(displayImagesOnPage,
                    {
                        "output_settings": [
                            {
                                "type": "return-base64",
                                "jpeg_quality": 40,
                                "format": "jpg"
                            }
                        ]
                    }
            );
        }
        /** Processes the scan result */
        function displayImagesOnPage(successful, mesg, response) {
            if(!successful) { // On error
                console.error('Failed: ' + mesg);
                return;
            }
            if(successful && mesg != null && mesg.toLowerCase().indexOf('user cancel') >= 0) { // User cancelled.
                console.info('User cancelled');
                return;
            }
            var scannedImages = scanner.getScannedImages(response, true, false); // returns an array of ScannedImage
            for(var i = 0; (scannedImages instanceof Array) && i < scannedImages.length; i++) {
                var scannedImage = scannedImages[i];
                processScannedImage(scannedImage);
            }
        }
        /** Images scanned so far. */
        var imagesScanned = [];
        /** Processes a ScannedImage */
        function processScannedImage(scannedImage) {
            imagesScanned.push(scannedImage);
            var elementImg = scanner.createDomElementFromModel( {
                'name': 'img',
                'attributes': {
                    'class': 'scanned',
                    'src': scannedImage.src
                }
            });
            document.getElementById('images').appendChild(elementImg);
        }
    </script>

    <style>
        img.scanned {
            height: 200px; /** Sets the display size */
            margin-right: 12px;
        }
        div#images {
            margin-top: 20px;
        }
    </style>


    <h2>Scan as JPG and display on the web page</h2>

    <button type="button" onclick="scanToJpg();">Scan</button>

    <div id="images"></div>

	<a href="ScannerProtocolApp:" >Run Desktop App</a>
 </div>