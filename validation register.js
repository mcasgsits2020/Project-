$(function(){
    var $registerForm = $("#registration");
    if($registerForm.length){
        $registerForm.validate({
     rules:{
         username:{
             required: true
         
         },
           fname:{
           required: true
  },
                lname:{
          
                required: true
           
            },
            
    gender:{
               
             required: true  
          
           },
           age:{
             required: true
                    
},
           email:{
             required: true
                    
},
           mobile:{
             required: true,
             minlength:10,
             maxlength:10,
             number: true
           
         },
           address:{
             required: true
                   
},
           password:{
             required: true
                    
},
           cpass:{
             required: true,
             equalTo: '#password'
         
     },   
 },
     messages:{
         
         username:{
             
             required: 'Please enter username '
         },
             fname:{
             required: 'Please enter firstrname '
                      
         },
            lname:{
             
             required: 'Please enter lastname '
                    
} , 
         gender:{
             
             required: 'Please enter gender '
               
},
    
        age:{
             
             required: 'Please enter age '
                
},
    
         email:{
             
             required: 'Please enter Email-Id '
         }         
},
                        
         mobile:{
             
             required: 'Please enter  Mobile number',
             minlength: 'Please enter 10 digit Mobile number',
             maxlength: 'Please enter 10 digit Mobile number'
         
         },               
                        
            address:{
             
             required: 'Please enter address '
                     
},
                        
              
         password:{
             
             required: 'Please enter password '
                
},
                 
         cpass:{
             
             required: 'Please enter confirm password ',
             equalTo: 'Please enter same password'
                
            }                
  });
}  
});/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


