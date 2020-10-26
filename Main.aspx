<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Main.aspx.vb" Inherits="MBS.WebForm14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="WOW Slider, Html Image Carousel, Image Carousel Html" />
	<meta name="description" content="WOWSlider created with WOW Slider, a free wizard program that helps you easily generate beautiful web slideshow" />
	<!-- Start WOWSlider HEAD section -->
	<link rel="stylesheet" type="text/css" href="engine1/style.css" media="screen" />
	<style type="text/css">a#vlb{display:none}</style>
	<script type="text/javascript" src="engine1/jquery.js"></script>
	<!-- End WOWSlider HEAD section -->

</head>
<body>
    <form id="form1" runat="server">
    <div>

         <style>
        body
        {
            font-family: Arial;
            font-size: 10pt;
            background-image:url('Image/loginbg.jpg');           
            background-repeat:no-repeat;
            background-attachment:fixed;
            /*background-position:center;*/
            background-size:cover;
            
        }
             #form1 {
                 text-align: justify;
             }
             .auto-style1 {
                 width: 86px;
             }
             </style>
        <br />
        <br />

        <table align="center"style="height: 150px; width: 1891px">
            <tr>
                    <td class="auto-style1">
                        &nbsp;&nbsp;
                        <asp:Image ID="img1" runat ="server" Height="100px" Width="100px" ImageAlign="AbsMiddle" ImageUrl="Image/npcil.png" style="text-align: center" />
                    </td>
                    <td>
                        <div style ="color :white; text-align :center; font-size :xx-large; ">
    
                                        एनपीसीआईएल, रावतभाटा राजस्थान साईट - मेडिकल बिल वेबसाइट में आपका हार्दिक स्वागत है।
                        <br />
                                NPCIL, Rawatbhata Rajasthan Site - Heartily welcome to Medical Bill Website.
                           
                        </div>
                    </td>
            </tr>
        </table>
       
            <br />
            <br />
            <br />
            <br />
            <br />
                                 <!-- Start WOWSlider.com BODY section -->
	                            <div id="wowslider-container1">
	                            <div class="ws_images">
                                    <a href="#"><img src="data1/images/baroli.jpg" alt="" title="" id="wows0"/></a>
                                    <a href="#"><img src="data1/images/chulia.jpg" alt="" title="" id="wows1"/></a>
                                    <a href="#"><img src="data1/images/padhajhad.jpg" alt="" title="" id="wows2"/></a>
                                    <a href="#"><img src="data1/images/rbt.jpg" alt="" title="" id="wows3"/></a>
                                    </div>
                                    <div class="ws_bullets"><div>
                                    <a href="#wows0" title=""><img src="data1/tooltips/baroli.jpg" alt=""/>1</a>
                                    <a href="#wows1" title=""><img src="data1/tooltips/chulia.jpg" alt=""/>2</a>
                                    <a href="#wows2" title=""><img src="data1/tooltips/padhajhad.jpg" alt=""/>3</a>
                                    <a href="#wows3" title=""><img src="data1/tooltips/rbt.jpg" alt=""/>4</a>
                                    </div></div>
                                    <a style="display:none" href="http://wowslider.com">jQuery Carousel Example by WOWSlider.com v1.7</a>
	                            <div class="ws_shadow"></div>
	                            </div>
	                            <script type="text/javascript" src="engine1/script.js"></script>
	                            <!-- End WOWSlider.com BODY section -->

        <br />
        <br />
      
       <div  style="font-family:Expo; font-size:xx-large ; ">


                                        <br /> 
                                                             
                                            <br />
&nbsp;&nbsp;
                                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span class="auto-style3" style="color: #FFFFFF; ">  
                                        The art of medicine consists in amusing the patient while nature cures the disease</span>
                                        <br />
                                        <br />
           
                               </div>
       
        <br />
        <br />
        <br />
        <br />
        <div style ="color :white; font-size :x-large; ">
    
                        <table align="justify-right" style="text-align: right; width: 1873px;">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                     <asp:ImageButton ID="loginbtn1" runat ="server" ImageUrl ="~/Image/loginlogo.png" Height="50px" Width="122px" />
                                </td>
                            </tr>
                           
                        </table>
          </div>

    </div>
    </form>

</body>
</html>
