<script type="text/javascript"> 
var script_mktEnquiry = {
    ACECustomerID_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('CustomerID','');
      var F_CustomerID = $get(sender._element.id);
      var F_CustomerID_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_CustomerID.value = p[0];
      F_CustomerID_Display.innerHTML = e.get_text();
    },
    ACECustomerID_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('CustomerID','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACECustomerID_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    ACEResponsibleSalsePerson_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('ResponsibleSalsePerson','');
      var F_ResponsibleSalsePerson = $get(sender._element.id);
      var F_ResponsibleSalsePerson_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_ResponsibleSalsePerson.value = p[0];
      F_ResponsibleSalsePerson_Display.innerHTML = e.get_text();
    },
    ACEResponsibleSalsePerson_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('ResponsibleSalsePerson','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACEResponsibleSalsePerson_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    ACEProjectID_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('ProjectID','');
      var F_ProjectID = $get(sender._element.id);
      var F_ProjectID_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_ProjectID.value = p[0];
      F_ProjectID_Display.innerHTML = e.get_text();
    },
    ACEProjectID_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('ProjectID','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACEProjectID_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    validate_MktVericalID: function(sender) {
      var Prefix = sender.id.replace('MktVericalID','');
      this.validated_FK_MKT_Enquiry_MktVerticalID_main = true;
      this.validate_FK_MKT_Enquiry_MktVerticalID(sender,Prefix);
      },
    validate_CustomerID: function(sender) {
      var Prefix = sender.id.replace('CustomerID','');
      this.validated_FK_MKT_Enquiry_CustomerID_main = true;
      this.validate_FK_MKT_Enquiry_CustomerID(sender,Prefix);
      },
    validate_MktSiteID: function(sender) {
      var Prefix = sender.id.replace('MktSiteID','');
      this.validated_FK_MKT_Enquiry_MktSiteID_main = true;
      this.validate_FK_MKT_Enquiry_MktSiteID(sender,Prefix);
      },
    validate_MktRegionID: function(sender) {
      var Prefix = sender.id.replace('MktRegionID','');
      this.validated_FK_MKT_Enquiry_MktRegionID_main = true;
      this.validate_FK_MKT_Enquiry_MktRegionID(sender,Prefix);
      },
    validate_IndianStateID: function(sender) {
      var Prefix = sender.id.replace('IndianStateID','');
      this.validated_FK_MKT_Enquiry_IndianStateID_main = true;
      this.validate_FK_MKT_Enquiry_IndianStateID(sender,Prefix);
      },
    validate_ResponsibleSalsePerson: function(sender) {
      var Prefix = sender.id.replace('ResponsibleSalsePerson','');
      this.validated_FK_MKT_Enquiry_SalesPerson_main = true;
      this.validate_FK_MKT_Enquiry_SalesPerson(sender,Prefix);
      },
    validate_ProjectID: function(sender) {
      var Prefix = sender.id.replace('ProjectID','');
      this.validated_FK_MKT_Enquiry_ProjectID_main = true;
      this.validate_FK_MKT_Enquiry_ProjectID(sender,Prefix);
      },
    validate_ProjectBaseID: function(sender) {
      var Prefix = sender.id.replace('ProjectBaseID','');
      this.validated_FK_MKT_Enquiry_ProjectBaseID_main = true;
      this.validate_FK_MKT_Enquiry_ProjectBaseID(sender,Prefix);
      },
    validate_OrderFinalizationYear: function(sender) {
      var Prefix = sender.id.replace('OrderFinalizationYear','');
      this.validated_FK_MKT_Enquiry_OrderYear_main = true;
      this.validate_FK_MKT_Enquiry_OrderYear(sender,Prefix);
      },
    validate_OrderFinalizationMonth: function(sender) {
      var Prefix = sender.id.replace('OrderFinalizationMonth','');
      this.validated_FK_MKT_Enquiry_OrderMonth_main = true;
      this.validate_FK_MKT_Enquiry_OrderMonth(sender,Prefix);
      },
    validate_EnquiryTypeID: function(sender) {
      var Prefix = sender.id.replace('EnquiryTypeID','');
      this.validated_FK_MKT_Enquiry_EnquiryTypeID_main = true;
      this.validate_FK_MKT_Enquiry_EnquiryTypeID(sender,Prefix);
      },
    validate_BidderTypeID: function(sender) {
      var Prefix = sender.id.replace('BidderTypeID','');
      this.validated_FK_MKT_Enquiry_BidderTypeID_main = true;
      this.validate_FK_MKT_Enquiry_BidderTypeID(sender,Prefix);
      },
    validate_FK_MKT_Enquiry_SalesPerson: function(o,Prefix) {
      var value = o.id;
      var ResponsibleSalsePerson = $get(Prefix + 'ResponsibleSalsePerson');
      if(ResponsibleSalsePerson.value==''){
        if(this.validated_FK_MKT_Enquiry_SalesPerson_main){
          var o_d = $get(Prefix + 'ResponsibleSalsePerson' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + ResponsibleSalsePerson.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_MKT_Enquiry_SalesPerson(value, this.validated_FK_MKT_Enquiry_SalesPerson);
      },
    validated_FK_MKT_Enquiry_SalesPerson_main: false,
    validated_FK_MKT_Enquiry_SalesPerson: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_mktEnquiry.validated_FK_MKT_Enquiry_SalesPerson_main){
        var o_d = $get(p[1]+'_Display');
        try{o_d.innerHTML = p[2];}catch(ex){}
      }
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        o.value='';
        o.focus();
      }
    },
    validate_FK_MKT_Enquiry_ProjectID: function(o,Prefix) {
      var value = o.id;
      var ProjectID = $get(Prefix + 'ProjectID');
      if(ProjectID.value==''){
        if(this.validated_FK_MKT_Enquiry_ProjectID_main){
          var o_d = $get(Prefix + 'ProjectID' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + ProjectID.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_MKT_Enquiry_ProjectID(value, this.validated_FK_MKT_Enquiry_ProjectID);
      },
    validated_FK_MKT_Enquiry_ProjectID_main: false,
    validated_FK_MKT_Enquiry_ProjectID: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_mktEnquiry.validated_FK_MKT_Enquiry_ProjectID_main){
        var o_d = $get(p[1]+'_Display');
        try{o_d.innerHTML = p[2];}catch(ex){}
      }
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        o.value='';
        o.focus();
      }
    },
    validate_FK_MKT_Enquiry_CustomerID: function(o,Prefix) {
      var value = o.id;
      var CustomerID = $get(Prefix + 'CustomerID');
      if(CustomerID.value==''){
        if(this.validated_FK_MKT_Enquiry_CustomerID_main){
          var o_d = $get(Prefix + 'CustomerID' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + CustomerID.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_MKT_Enquiry_CustomerID(value, this.validated_FK_MKT_Enquiry_CustomerID);
      },
    validated_FK_MKT_Enquiry_CustomerID_main: false,
    validated_FK_MKT_Enquiry_CustomerID: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_mktEnquiry.validated_FK_MKT_Enquiry_CustomerID_main){
        var o_d = $get(p[1]+'_Display');
        try{o_d.innerHTML = p[2];}catch(ex){}
      }
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        o.value='';
        o.focus();
      }
    },
    temp: function() {
    }
    }
</script>
