<script type="text/javascript"> 
var script_mktSalesPersons = {
    ACESerialNo_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('SerialNo','');
      var F_SerialNo = $get(sender._element.id);
      var F_SerialNo_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_SerialNo.value = p[0];
      F_SerialNo_Display.innerHTML = e.get_text();
    },
    ACESerialNo_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('SerialNo','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACESerialNo_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    ACESalesPerson_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('SalesPerson','');
      var F_SalesPerson = $get(sender._element.id);
      var F_SalesPerson_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_SalesPerson.value = p[0];
      F_SalesPerson_Display.innerHTML = e.get_text();
    },
    ACESalesPerson_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('SalesPerson','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACESalesPerson_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    validate_SerialNo: function(sender) {
      var Prefix = sender.id.replace('SerialNo','');
      this.validated_FK_MKT_SalesPersons_SerialNo_main = true;
      this.validate_FK_MKT_SalesPersons_SerialNo(sender,Prefix);
      },
    validate_SalesPerson: function(sender) {
      var Prefix = sender.id.replace('SalesPerson','');
      this.validated_FK_MKT_SalesPersons_SalesPerson_main = true;
      this.validate_FK_MKT_SalesPersons_SalesPerson(sender,Prefix);
      },
    validate_FK_MKT_SalesPersons_SalesPerson: function(o,Prefix) {
      var value = o.id;
      var SalesPerson = $get(Prefix + 'SalesPerson');
      if(SalesPerson.value==''){
        if(this.validated_FK_MKT_SalesPersons_SalesPerson_main){
          var o_d = $get(Prefix + 'SalesPerson' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + SalesPerson.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_MKT_SalesPersons_SalesPerson(value, this.validated_FK_MKT_SalesPersons_SalesPerson);
      },
    validated_FK_MKT_SalesPersons_SalesPerson_main: false,
    validated_FK_MKT_SalesPersons_SalesPerson: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_mktSalesPersons.validated_FK_MKT_SalesPersons_SalesPerson_main){
        var o_d = $get(p[1]+'_Display');
        try{o_d.innerHTML = p[2];}catch(ex){}
      }
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        o.value='';
        o.focus();
      }
    },
    validate_FK_MKT_SalesPersons_SerialNo: function(o,Prefix) {
      var value = o.id;
      var SerialNo = $get(Prefix + 'SerialNo');
      if(SerialNo.value==''){
        if(this.validated_FK_MKT_SalesPersons_SerialNo_main){
          var o_d = $get(Prefix + 'SerialNo' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + SerialNo.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_MKT_SalesPersons_SerialNo(value, this.validated_FK_MKT_SalesPersons_SerialNo);
      },
    validated_FK_MKT_SalesPersons_SerialNo_main: false,
    validated_FK_MKT_SalesPersons_SerialNo: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_mktSalesPersons.validated_FK_MKT_SalesPersons_SerialNo_main){
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
