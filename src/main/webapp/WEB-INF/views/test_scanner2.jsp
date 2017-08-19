 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<br>
<br>
<br>
<br>
<br>

<style>
	
</style>

<div class="wrapper col-lg-offset-5" style="height:500px;">
	<script type="text/javascript" src="/app/resources/Scanner/dynamsoft.webtwain.config.js"></script> 
    <script type="text/javascript" src="/app/resources/Scanner/dynamsoft.webtwain.initiate.js"></script>
    

    <label>
        <input type="checkbox" id="ShowUI">Show UI</label>
        <select size="1" id="source" style="position: relative; width: 220px;"></select>
    <input type="button" value="Scan" onclick="AcquireImage();" />
	
	<div style="width: 480px; display: block;">

        <!-- dwtcontrolContainer is the default div id for Dynamic Web TWAIN control.
        If you need to rename the id, you should also change the id in the dynamsoft.webtwain.config.js accordingly. -->
        <div id="dwtcontrolContainer"></div>

        <div>
            <input onclick="btnFirstImage_onclick()" type="button" value=" |< " />
            <input onclick="btnPreImage_onclick()" type="button" value=" < " />
            <input type="text" size="2" id="DW_CurrentImage" readonly="readonly" value="0" />
            /
            <input type="text" size="2" id="DW_TotalImage" readonly="readonly" value="0" />
            <input onclick="btnNextImage_onclick()" type="button" value=" > " />
            <input onclick="btnLastImage_onclick()" type="button" value=" >| " />
            Preview Mode:
            <select size="1" id="DW_PreviewMode" onchange="setlPreviewMode();">
                <option value="0">1X1</option>
                <option value="1">2X2</option>
                <option value="2">3X3</option>
                <option value="3">4X4</option>
                <option value="4">5X5</option>
            </select>
        </div>
    </div>
    
    <input onclick="btnRemoveSelectedImages_onclick()" type="button" value="Remove Selected Images" />
    <input onclick="btnRemoveAllImages_onclick()" type="button" value="Remove All Images" />
    
    <!-- dwtcontrolContainer is the default div id for Dynamic Web TWAIN control.
    If you need to rename the id, you should also change the id in the dynamsoft.webtwain.config.js accordingly. -->
    <div id="dwtcontrolContainer"></div>

    <script type="text/javascript">
        Dynamsoft.WebTwainEnv.RegisterEvent('OnWebTwainReady', Dynamsoft_OnReady);  // Register OnWebTwainReady event. This event fires as soon as Dynamic Web TWAIN is initialized and ready to be used

        var DWObject;
        
        

        function Dynamsoft_OnReady() {
            DWObject = Dynamsoft.WebTwainEnv.GetWebTwain('dwtcontrolContainer');    // Get the Dynamic Web TWAIN object that is embeded in the div with id 'dwtcontrolContainer'
            if (DWObject) {
                var count = DWObject.SourceCount;
    			if(count == 0 && Dynamsoft.Lib.env.bMac)
    			{
    				DWObject.CloseSourceManager();
    				DWObject.ImageCaptureDriverType = 0;
    				DWObject.OpenSourceManager();
    				count = DWObject.SourceCount;
    			}
    			
                for (var i = 0; i < count; i++)
                    document.getElementById("source").options.add(new Option(DWObject.GetSourceNameItems(i), i));
               
                DWObject.RegisterEvent("OnPostTransfer", function () {
                    updatePageInfo();
                });

                // The event OnPostLoad fires after the images from a local directory have been loaded into the control
                DWObject.RegisterEvent("OnPostLoad", function () {
                    updatePageInfo();
                });

                // The event OnMouseClick fires when the mouse clicks on an image on Dynamic Web TWAIN viewer
                DWObject.RegisterEvent("OnMouseClick", function () {
                    updatePageInfo();
                });

                // The event OnTopImageInTheViewChanged fires when the top image currently displayed in the viewer changes
                DWObject.RegisterEvent("OnTopImageInTheViewChanged", function (index) {
                    DWObject.CurrentImageIndexInBuffer = index;
                    updatePageInfo();
                });
            }
        }
        function AcquireImage() {
            if (DWObject) {
            	var OnAcquireImageSuccess, OnAcquireImageFailure;
				OnAcquireImageSuccess = OnAcquireImageFailure = function (){
					DWObject.CloseSource();
				};
				
                DWObject.SelectSourceByIndex(document.getElementById("source").selectedIndex);
                DWObject.OpenSource();
                DWObject.IfDisableSourceAfterAcquire = true;
                
                //If show UI
                if (document.getElementById("ShowUI").checked)
                    DWObject.IfShowUI = true;
                else
                    DWObject.IfShowUI = false;
                
					
				DWObject.AcquireImage(OnAcquireImageSuccess, OnAcquireImageFailure);
            }
        }
        
        function OnSuccess() {
            console.log('successful');
        }

        function OnFailure(errorCode, errorString) {
            alert(errorString);
        }

        function LoadImage() {
            if (DWObject) {
                DWObject.IfShowFileDialog = true; // Open the system's file dialog to load image
                DWObject.LoadImageEx("", EnumDWT_ImageType.IT_ALL, OnSuccess, OnFailure); // Load images in all supported formats (.bmp, .jpg, .tif, .png, .pdf). OnSuccess or OnFailure will be called after the operation
            }
        }

        function btnPreImage_onclick() {
            if (DWObject) {
                if (DWObject.HowManyImagesInBuffer > 0) {
                    DWObject.CurrentImageIndexInBuffer = DWObject.CurrentImageIndexInBuffer - 1;
                    updatePageInfo();
                }
            }
        }

        function btnNextImage_onclick() {
            if (DWObject) {
                if (DWObject.HowManyImagesInBuffer > 0) {
                    DWObject.CurrentImageIndexInBuffer = DWObject.CurrentImageIndexInBuffer + 1;
                    updatePageInfo();
                }
            }
        }

        function btnFirstImage_onclick() {
            if (DWObject) {
                if (DWObject.HowManyImagesInBuffer != 0 && DWObject.CurrentImageIndexInBuffer != 0) {
                    DWObject.CurrentImageIndexInBuffer = 0;
                    updatePageInfo();
                }
            }
        }

        function btnLastImage_onclick() {
            if (DWObject) {
                if (DWObject.HowManyImagesInBuffer > 0) {
                    DWObject.CurrentImageIndexInBuffer = DWObject.HowManyImagesInBuffer - 1;
                    updatePageInfo();
                }
            }
        }
        function setlPreviewMode() {
            if (DWObject) {
                var o = parseInt(document.getElementById("DW_PreviewMode").selectedIndex + 1);
                DWObject.SetViewMode(o, o);
            }
        }

        function btnRemoveSelectedImages_onclick() {
            if (DWObject) {
                DWObject.RemoveAllSelectedImages();
                if (DWObject.HowManyImagesInBuffer == 0) {
                    document.getElementById("DW_CurrentImage").value = "0";
                    document.getElementById("DW_TotalImage").value = "0";
                }
                else {
                    updatePageInfo();
                }
            }
        }

        function btnRemoveAllImages_onclick() {
            if (DWObject) {
                DWObject.RemoveAllImages();
                document.getElementById("DW_TotalImage").value = "0";
                document.getElementById("DW_CurrentImage").value = "0";
            }
        }

        function updatePageInfo() {
            if (DWObject) {
                document.getElementById("DW_TotalImage").value = DWObject.HowManyImagesInBuffer;
                document.getElementById("DW_CurrentImage").value = DWObject.CurrentImageIndexInBuffer + 1;
            }
        }
    </script>
</div>

 
