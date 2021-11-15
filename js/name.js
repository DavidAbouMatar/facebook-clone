$(document).ready(getProfileName);

function getProfileName(){
    let first_name = $('#username')
   
    getProfileApi().then(profile => {
        first_name.text(profile[0]['name'] + " " + profile[0]['last_name']) 
        
    });
  
  }
  
  async function getProfileApi(){
    const response = await fetch("http://localhost/friend-finder/Controllers/api/get_profile.php");
    
    if(!response.ok){
        const message = "ERROR OCCURED";
        throw new Error(message);
    }
    
    const profile = await response.json();
    return profile;
  }
  