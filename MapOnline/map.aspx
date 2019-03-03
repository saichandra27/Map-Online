<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits ="map"  Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>     
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/button/button-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/dragdrop/dragdrop-min.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/container/container-min.js"></script>
    <script type="text/javascript">document.documentElement.className = "yui-pe";</script>     
    
    

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" EnablePageMethods ="true" runat="server">
    </asp:ToolkitScriptManager>
    
    <asp:SliderExtender ID="SliderExtender1" Minimum ="1" Maximum = "7"
    TargetControlID ="txtbedrooms" BoundControlID ="lblbedrooms"
    runat="server">
    </asp:SliderExtender>
    <asp:SliderExtender ID="SliderExtender2" Minimum ="1" Maximum = "3"
    TargetControlID ="txtbathrooms" BoundControlID ="lblbathrooms"
    runat="server">
    </asp:SliderExtender>
    <asp:SliderExtender ID="SliderExtender3" Minimum ="1" Maximum = "4600"
    TargetControlID ="txtrentrange" BoundControlID ="lblrentrange"
    runat="server">
    </asp:SliderExtender>
    <script type ="text/javascript">
        var map, marker, l, infowindow,num,spancity,divinfo,txtbxparam,txtidparam,txtid,URL;    
        var coordinates =[]; var info =[];var cont=[];var ids =[];
        coordinates = [<% = crdnts %>]; 
        info =[<% = title %>];
        cont =[<% =cnt %>];
        ids =[<%=id %>];
    function initializeControl(map) 
    {
        var btndiv = document.createElement('div');
        btndiv.innerHTML = '<table><tr class ="ml_menu"><td><p id ="phome" runat ="server"><a href ="map.aspx">Home</p></a></td><td ><p id ="plgn" runat ="server"><a href ="#" id ="arlogin">Login</a></p></td><td><p id ="psrch"><a href ="#" id ="arsearch">Search</a></p></td><td><p id ="pfvts" runat ="server"><a href ="#" id ="arfavourites">MyFavourites</a></p></td><td ><p id ="pprofle" runat="server"><a href ="#" id ="arprofile">MyProfile</a></p></td><td><a href ="AddAProperty.aspx" id ="araddproperty" runat="server">Add A Property</a></td><td><a id ="arloginname" href ="#"><asp:LoginName ID="LoginName1" runat="server" Font-Underline="false" ForeColor ="White" Font-Bold ="true" Font-Size="Large" /></a></td><td><asp:Button ID="btnlogout" runat="server" Text="Logout" class ="lgtbutton" /></td></tr></table>'; 
        btndiv.index = 1;
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(btndiv);       
    }
    function setevents()
     {
            displayprofiledialog();
        displayfavouritesdialog();
        displaysearchdialog();
        displaylogindialog();
        return false;
    }
    function InitializeMap()
    {
        setMapDimensions();
        var latlng = new google.maps.LatLng(20.59,78.96);
        var myOptions = {
            zoom: 5,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map"), myOptions);
        initializeControl(map);setevents();
    }
    function InitializeMap2()
    {
        setMapDimensions();
        var latlng = new google.maps.LatLng(20.59,78.96);
        var myOptions = {
            zoom: 10,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map"), myOptions);
        initializeControl(map);
        setevents();
    }
    function markicons()
    {
        InitializeMap();
        var ltlng = [];
        var places =[];
        
        ltlng.push(new google.maps.LatLng(12.97,77.59));
        ltlng.push(new google.maps.LatLng(18.52,73.86));
        ltlng.push(new google.maps.LatLng(13.06,80.25));
        ltlng.push(new google.maps.LatLng(17.39,78.49));
        ltlng.push(new google.maps.LatLng(19.02,72.86));
        ltlng.push(new google.maps.LatLng(28.46,77.02));
        ltlng.push(new google.maps.LatLng(22.57,88.36));
        ltlng.push(new google.maps.LatLng(11.02,76.96));
        ltlng.push(new google.maps.LatLng(9.94,76.26));
        ltlng.push(new google.maps.LatLng(28.58,77.33));
        ltlng.push(new google.maps.LatLng(15.3,74.12));
        ltlng.push(new google.maps.LatLng(19.23,72.97));
        ltlng.push(new google.maps.LatLng(19.03,73.03));

        places.push("Bangalore");places.push("Pune");places.push("Chennai");places.push("Hyderabad");places.push("Mumbai");
        places.push("Gurgaon");places.push("Calcutta");places.push("Coimbatore");places.push("Cochin");places.push("Noida");
        places.push("Goa");places.push("Thane");places.push("Mumbai-Navi");        
         
        map.setCenter(new google.maps.LatLng(20.59,78.96));
        spancity = document.getElementById("<%=city.ClientID%>");
        divinfo = document.getElementById("placesmarker");
        
        for (var i = 0; i <= ltlng.length; i++) {
            marker = new google.maps.Marker({
                map: map,
                position: ltlng[i]
            });

            (function (i, marker) {

                google.maps.event.addListener(marker, 'click', function () {

                    if (!infowindow) {
                        infowindow = new google.maps.InfoWindow();
                    }
                    spancity.innerHTML ="";
                    spancity.innerHTML= places[i];
                    infowindow.setContent(divinfo.innerHTML);
                    infowindow.open(map, marker);

                });

            })(i, marker);
        }

    }
    
    function setMapDimensions()
    {
         var myWidth;
         var myHeight;
         if( typeof( window.innerWidth ) == 'number' ) 
         { 
                     //Non-IE 
            myWidth = window.innerWidth;
            myHeight = window.innerHeight; 
         } 
         else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) 
         { 

            //IE 6+ in 'standards compliant mode' 
            myWidth = document.documentElement.clientWidth; 
            myHeight = document.documentElement.clientHeight; 
        } 
        else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) 
        { 
            //IE 4 compatible 
            myWidth = document.body.clientWidth; 
            myHeight = document.body.clientHeight; 
        }   
        
        document.getElementById("map").style.width = myWidth+'px';
        document.getElementById("map").style.height = myHeight+'px';
             
    }
       
   
    function setmarkericons()  
    {
        txtbxparam = document.getElementById("<%=TextBox1.ClientID%>");
        txtbxparam.value = spancity.innerHTML; 
    }
    function setidvalue()
    {
        txtidparam = document.getElementById("<%=TextBox2.ClientID%>");
        txtidparam.value = txtid.innerHTML; 
    }
    function setmarkeric()
    {
        InitializeMap2();        
        l = coordinates[0].split(",");
        
         txtid = document.getElementById("<%=txtid.ClientID%>");
         var txttitle = document.getElementById("<%=prtytitle.ClientID%>");
         var txtcnt = document.getElementById("<%=prtycontent.ClientID%>");
       
         l = coordinates[0].split(",");
           map.setCenter(new google.maps.LatLng(l[0], l[1]));
            for (var i = 0; i < coordinates.length; i++) 
             {
                            
                 var divinfo = document.getElementById('markercontent');         
                 l = coordinates[i].split(",");
                 marker = new google.maps.Marker({
                          map: map,
                          position: new google.maps.LatLng(l[0], l[1])
                          });                         
                  (function (i, marker) 
                        {google.maps.event.addListener(marker, 'click', 
                            function () 
                                {
                                    if (!infowindow) 
                                    {
                                        infowindow = new google.maps.InfoWindow();
                                    } 
                                    txtid.innerHTML ="";
                                    txttitle.innerHTML ="";
                                    txtcnt.innerHTML ="";                                                                   
                                    txtid.innerHTML = ids[i];
                                    txttitle.innerHTML = info[i];                                    
                                    txtcnt.innerHTML = cont[i];                                                               
                                    infowindow.setContent(divinfo.innerHTML);
                                    infowindow.open(map, marker);});})(i, marker);                               
                                }    
    }
      
    function displaylogindialog()
     {
          YAHOO.namespace("example.container");
          YAHOO.util.Event.onDOMReady(function () {
	      var e = document.getElementById('loginbox');
	      e.style.display ="block";	      
	      var handleSubmit = function() {this.submit();	};
	      var handleCancel = function() {this.cancel();};
	      var handleSuccess = function(o) {};
	      var handleFailure = function(o) {alert("Submission failed: " + o.status);};
	      YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("loginbox", 
							{ width : "30em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true
							});
	      YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	      YAHOO.example.container.dialog1.render();
	      YAHOO.util.Event.addListener("arlogin", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);	
          });
          return false;
     }
     function displaysearchdialog()
     {        
          YAHOO.namespace("example.container");
          YAHOO.util.Event.onDOMReady(function () {
	      var e = document.getElementById('searchbox');
	      e.style.display ="block";	      
	      var handleSubmit = function() {this.submit();	};
	      var handleCancel = function() {this.cancel();};
	      var handleSuccess = function(o) {};
	      var handleFailure = function(o) {alert("Submission failed: " + o.status);};
	      YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("searchbox", 
							{ width : "30em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true
							});
	      YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	      YAHOO.example.container.dialog1.render();
	      YAHOO.util.Event.addListener("arsearch", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);	     
          });
          return false;
     }  
     function displayfavouritesdialog()
     {        
          YAHOO.namespace("example.container");
          YAHOO.util.Event.onDOMReady(function () {
	      var e = document.getElementById('MyFavourites');
	      e.style.display ="block";	      
	      var handleSubmit = function() {this.submit();	};
	      var handleCancel = function() {this.cancel();};
	      var handleSuccess = function(o) {};
	      var handleFailure = function(o) {alert("Submission failed: " + o.status);};
	      YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("MyFavourites", 
							{ width : "30em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true
							});
	      YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	      YAHOO.example.container.dialog1.render();
	      YAHOO.util.Event.addListener("arfavourites", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);	     
          });
          return false;
     }  
     function displayprofiledialog()
     {        
          YAHOO.namespace("example.container");
          YAHOO.util.Event.onDOMReady(function () {
	      var e = document.getElementById('MyProfile');
	      e.style.display ="block";	      
	      var handleSubmit = function() {this.submit();	};
	      var handleCancel = function() {this.cancel();};
	      var handleSuccess = function(o) {};
	      var handleFailure = function(o) {alert("Submission failed: " + o.status);};
	      YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("MyProfile", 
							{ width : "30em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true
							});
	      YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	      YAHOO.example.container.dialog1.render();
	      YAHOO.util.Event.addListener("arprofile", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);	     
          });
          return false;
     }
     function showlogin()
     {
        var lgn = document.getElementById('lgn');         
        lgn.style.display = 'block';   
        lgn.style.width = '100%';
        var Rgstr = document.getElementById('Rgstr');         
        Rgstr.style.display = 'none';
        var Frgt = document.getElementById('Frgt');         
        Frgt.style.display = 'none'; 
     }
     function showrgstr()
     {
        var lgn = document.getElementById('lgn');         
        lgn.style.display = 'none';           
        var Rgstr = document.getElementById('Rgstr');         
        Rgstr.style.display = 'block';
        Rgstr.style.width = '100%';
        var Frgt = document.getElementById('Frgt');         
        Frgt.style.display = 'none'; 
     }
     function showfrgt()
     {
        var lgn = document.getElementById('lgn');         
        lgn.style.display = 'none';           
        var Rgstr = document.getElementById('Rgstr');         
        Rgstr.style.display = 'none';        
        var Frgt = document.getElementById('Frgt');         
        Frgt.style.display = 'block'; 
        Frgt.style.width = '100%';
     }
     function showpropertyinfo()
     {
        var lgn = document.getElementById('infowindow');         
        lgn.style.display = 'block';   
        lgn.style.width = '100%';
        var Rgstr = document.getElementById('wiki');         
        Rgstr.style.display = 'none';
        var Frgt = document.getElementById('walkscore');         
        Frgt.style.display = 'none'; 
     }
     function showwiki()
     {
        var lgn = document.getElementById('infowindow');         
        lgn.style.display = 'none';           
        var Rgstr = document.getElementById('wiki');         
        Rgstr.style.display = 'block';
        Rgstr.style.width = '100%';
        var Frgt = document.getElementById('walkscore');         
        Frgt.style.display = 'none'; 
     }
     function showwalkscore()
     {
        var lgn = document.getElementById('infowindow');         
        lgn.style.display = 'none';           
        var Rgstr = document.getElementById('wiki');         
        Rgstr.style.display = 'none';        
        var Frgt = document.getElementById('walkscore');         
        Frgt.style.display = 'block'; 
        Frgt.style.width = '100%';
     }
     (function(d, s, id) 
     {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    

    </script>     
    
        
    <table>
    <tr>
    <td align ="center" style ="margin-left:350px;">
    <asp:UpdateProgress ID="UpdateProgress1"
        AssociatedUpdatePanelID="UpdatePanel5"
        runat="server">
            <ProgressTemplate>
            <img alt="progress" src="progress.gif" width ="50px" height ="50px"/>            
             Processing...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </td>
    </tr>
    <tr>
    <td>
     <div id ="map"></div> 
    </td>
    </tr>
    </table>
    
     
    <div id="placesmarker" style ="display:none" >
    <span id ="city" runat ="server"></span><br />
    <asp:LinkButton ID="btndisplayprts" runat="server" OnClientClick="setmarkericons();"    OnClick ="btndisplayprts_Click" >Find Properties</asp:LinkButton>
    </div> 
    <div id ="markercontent" style ="width:200px;display:none">    
      <div id ="markertabs" class ="mlm_menu">
    <a href ="#" onclick ="showpropertyinfo()">PropertyInfo
    
    </a>
    <a href ="#" onclick ="showwiki()">Wiki</a>
    <a href ="#" onclick ="showwalkscore()">WalkScore</a>
    </div>
      <table>
    <tr>
    <td>
      <div id ="infowindow" style ="display:block;width:100%">                
            <span id ="txtid" runat ="server" style ="display:none"></span><br />
            <h3><span id ="prtytitle" runat ="server"></span></h3>   <br />
            <p id ="prtycontent" runat ="server"></p><br />
            <a href ="mailto:me@yahoo.com?Subject=Reply Listing on Mapoline&Body=<b><p>Hi,<br/> I'm emailing about your listing Is it still available?<br/> When would be a good time to see it? Thanks!</p></b>">Send An Email</a><br />
            Source :<b>INDIAPROPERTIES</b><br />
       <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
        <table>
        <tr>
        <td>
            <asp:Label ID="lblnotes" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="txtnotes" runat="server" TextMode ="MultiLine" style ="display:none" ></asp:TextBox>
        </td>
        </tr>
        <tr>
            <asp:ImageButton ID="btneditnotes" onclick="btneditnotes_Click" ImageUrl ="~/pencil.png" runat="server" />
            <asp:Button ID="btnupdatenotes"  onclick="btnupdatenotes_Click" runat="server" Text="Update" style ="display:none" />
        </tr>
        <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </td>
        </tr>
        <tr>
            <td>
              <asp:Button ID="btnsetasfavourite" OnClientClick ="setidvalue();"  onclick="btnsetasfavourite_Click" runat="server" Text="Set As Favourite"  /></td>
              <td><input id="Button2" type="button" value="Hide This From The Map" />
            </td>
        </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>         
      </div>
    </td>
    <td>
    <div id ="wiki" style ="display:none;width:100%">
        Wiki 
     </div>
    </td>
    <td>    
    <div id ="walkscore" style ="display:none;width:100%">
        WalkScore
    </div>
    </td>
    </tr>
    </table>
    </div>
    <div class="yui-skin-sam">
    <div id="loginbox" class="yui-pe-content" style ="display:none;background-color:White" >
    <div class="hd" style="background-color:White; border-width:0px;border-style:none;">Mapoline.com</div>
    <div id ="tabs" class ="ml_menu">
    <a href ="#" onclick ="showlogin()">Login</a>
    <a href ="#" onclick ="showrgstr()">Register</a>
    <a href ="#" onclick ="showfrgt()">Forgot</a>
    </div>
    <table>  
    <tr>
    <td>
    <div id ="lgn" style ="display:block">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Login ID="Login1" runat="server">
            </asp:Login>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </td>
    <td>
    <div id ="Rgstr" style ="display:none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
        </ContentTemplate>
        </asp:UpdatePanel> 
     </div>
    </td>
    <td>    
    <div id ="Frgt" style ="display:none">
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
        </asp:PasswordRecovery>
    </div>
    </td>
    </tr>
    </table>
     </div>
    </div>     
    <div class="yui-skin-sam">
    <div id ="searchbox"  class="yui-pe-content" style ="display:none;background-color:White" >
    <div class="hd" style="background-color:White; border-width:0px;border-style:none;">Mapoline.com</div>
            <table title ="Advanced Search" id ="advancedsearch" >
            <thead>
            <tr><th colspan ="2" align ="center">||<a href ="#">About</a>||<a href ="#">Blog</a>||<a href ="#">iPhone</a>||<a href ="#">Android</a>||</th></tr>
            </thead>
               <tr>
               <td>
               <asp:Image ID="Image1" ImageUrl ="~/logo.bmp" runat="server" />
               </td>
               <td>
               <div id="fb-root"></div>
               <div class="fb-like" data-href="http://mapoline.somee.com/" data-send="true" data-width="450" data-show-faces="false"></div>
               <br />
             
               </td>
               </tr>
                  <tr>
                            <td>Where To ?</td>
                            <td>
                              <asp:TextBox ID="txtplace" runat="server"></asp:TextBox>
                              <asp:Button ID="btnfind" runat="server" Text="Go" OnClick ="btnfind_Click"  />
                            </td>
                  </tr>
                  <tr>
                    <td>BedRooms:<br />1 - 7 Beds</td>
                    <td>
                        <asp:TextBox ID="txtbedrooms" runat="server"></asp:TextBox>
                        <asp:Label ID="lblbedrooms" runat="server" Text=""></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td>BathRooms:<br />1-3+ Baths</td>
                    <td>
                        <asp:TextBox ID="txtbathrooms" runat="server" Width="204px"></asp:TextBox>
                        <asp:Label ID="lblbathrooms" runat="server" Text="Label"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td>Rent Range:<br />$0 - 4600</td>
                    <td>
                        <asp:TextBox ID="txtrentrange" runat="server" Width="204px"></asp:TextBox>
                        <asp:Label ID="lblrentrange" runat="server" Text="Label"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td>Types:</td>
                     <td>
                         <asp:CheckBox ID="CheckBox1" runat="server" Text="Rent" />
                         <asp:CheckBox ID="CheckBox2" runat="server" Text="Lease" />
                         <asp:CheckBox ID="CheckBox3" runat="server" Text="Sale" />
                     </td>
                  </tr>
             </table>
    </div>
    </div>
    <div class="yui-skin-sam">
    <div id ="MyFavourites"  class="yui-pe-content" style ="display:none; background-color:White; width:350px; overflow:auto" >
    <div class="hd" style="background-color:White; border-width:0px;border-style:none;">Mapoline.com
    <asp:UpdateProgress ID="UpdateProgress2" 
        AssociatedUpdatePanelID="UpdatePanel3"
        runat="server">
            <ProgressTemplate>
            <img alt="progress" src="progress.gif" style="height: 50px; width:50px;margin-left:120px;"/>            
             Processing...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">   
        <ContentTemplate>
        <div id="myfavorites"  style ="width:100%;overflow:auto">
    <h3>My Saved Items</h3>
    <asp:CheckBox ID="chkshow" runat="server" Text ="Show Saved Items" /><br />
    <asp:CheckBox ID="chkall" runat="server" Text ="Show All Items" /><br />
    <asp:Repeater ID="Repeater1" runat="server" onitemcommand="Repeater1_ItemCommand"> 
        <ItemTemplate>        
        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# Bind("Link") %>'>
        </asp:HyperLink><br />
        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Body") %>'></asp:Label><br />
        <asp:TextBox ID="txtcomments" runat="server" Visible ="false"></asp:TextBox><br />
        <asp:ImageButton ID="btnedit" ImageUrl ="~/pencil.png" runat="server" CommandName ="editComments" />
        <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName ="updateComments" Visible ="false"  />
        <hr />
        </ItemTemplate>   
    </asp:Repeater>
    </div>
        </ContentTemplate>
        </asp:UpdatePanel>        
    </div>
    </div>    
    <div class="yui-skin-sam">
    <div id ="MyProfile"  class="yui-pe-content" style ="display:none; background-color:White; width:350px">
    <div class="hd" style="background-color:White; border-width:0px;border-style:none;">Mapoline.com</div>             
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
        <table id ="profilebox">
        <tr>
        <th colspan ="2">MyProfile</th>
        </tr>
        <tr id ="trfirstname" runat ="server">
        <td>First Name:</td> 
        <td>
        <asp:Label ID="lblfirstname" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
        </td>  
        </tr>
        <tr id ="trlastname" runat ="server">
        <td>Last Name:</td>
        <td>
        <asp:Label ID="lbllastname" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="tremailid" runat ="server">
        <td>EmailID:</td>
        <td>
        <asp:Label ID="lblemailid" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtemailid" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trphonenumber" runat ="server">
        <td>Phone Number:</td>
        <td>
        <asp:Label ID="lblphonenumber" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtphonenumber" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trpets" runat ="server">
        <td>Pets?:</td>
        <td>
        <asp:Label ID="lblpets" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtpets" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="tremployed" runat ="server"><td>Employed?:</td>
        <td>
        <asp:Label ID="lblemployed" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtemployed" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trincome" runat ="server">
        <td>Income:</td>
        <td>
        <asp:Label ID="lblincome" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtincome" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trmoveindate" runat ="server">
        <td>Move-In Date:</td> 
        <td>
        <asp:Label ID="lblmoveindate" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtmoveindate" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trbestdays" runat ="server">
        <td>Best Days/Time-to-Visit:</td>
        <td>
        <asp:Label ID="lblbestdays" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtbestdays" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr id ="trabout" runat ="server">
        <td>About You/Comments:</td>
        <td>
        <asp:Label ID="lblcomments" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtcomments" runat="server"></asp:TextBox>
        </td>
        </tr>    
        <tr>
        <td><asp:Button ID="btnupdate" runat="server" Text="Update" OnClick ="btnupdate_Click"  /></td>
        <td><asp:Button ID="btnedit" runat="server" Text="Edit" OnClick ="btnedit_Click"  /></td>
        </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updProgress" 
        AssociatedUpdatePanelID="UpdatePanel4"
        runat="server">
            <ProgressTemplate>
            <img alt="progress" src="progress.gif" style="height: 50px; width:50px;margin-left:120px;"/>            
             Processing...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    </div>
       
    <asp:TextBox ID="TextBox1" runat="server" style ="display:none"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" style ="display:none"></asp:TextBox>

   
   
   
</asp:Content>

