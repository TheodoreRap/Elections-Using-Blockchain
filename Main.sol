pragma solidity ^0.4.0;

contract ekloges {
    	
    uint[5] public choices=[0,0,0,0,0];
    uint[] public users=[0];
    uint[] public allusers=[0];
    uint public energo=0;
   
    function putin (uint id) public returns (uint) {              
        uint f=0;
        uint i;        
        for ( i=0;i<allusers.length;i++){
            if(allusers[i]==id) {f=1; break;}                   
            }
            if(f==0){   
               allusers.push(id);
               return id;
               }
        return allusers.length;    
    }	
    
    function getResult (uint x) public view returns (uint) {

        if(energo==2){
            return choices[x];
        }
        else{
            return 0;
        }
    }
    
    function startvote () public returns (uint){
        if(energo==0)  energo=1;
        return energo;
    }
    
    function stopvote () public  returns (uint){
        if(energo==1) energo=2;
        return energo;
    }
    
    function vote (uint x,uint id) public  {
               
        uint f1=0;
        uint i;
               
        if(energo==1){
            for (i=0;i<allusers.length;i++){
                if(allusers[i]==id) {f1=1; break;}
            }
            if(f1==1){
                uint f=0;
                for ( i=0;i<users.length;i++){
                    if(users[i]==id) {f=1; break;} 
                 }
                    if(f==0){
                        choices[x]++;
                        users.push(id);
                    }
            }
       }  
    }		
}
