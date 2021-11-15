$(document).ready(getProfileInfo);
$('.saveProfile').click(saveInfo)

function getProfileInfo(){
    let first_name = $('#firstname')
    let last_name = $('#lastname')
    let email = $('#email')
    let birthdate = $('#birthdate')
    let checkmale = $('#male')
    let checkfemale = $('#female')
    let city = $('#city')
    let country = $('#country')
    getProfileApi().then(profile => {
        first_name.val(profile[0]['name'])
        last_name.val(profile[0]['last_name'])
        email.val(profile[0]['email'])
        birthdate.val(profile[0]['date_of_birth'])
        city.val(profile[0]['city'])
        country.val(profile[0]['country'])
        if(profile[0]['gender'] == 'Male'){
            checkmale.prop('checked', true)
        }else{
            checkfemale.prop('checked', true)
        }
      

        
    });

}
// save Profile



async function getProfileApi(){
    const response = await fetch("http://localhost/friend-finder/Controllers/api/get_profile.php");
    
    if(!response.ok){
        const message = "ERROR OCCURED";
        throw new Error(message);
    }
    
    const profile = await response.json();
    return profile;
}



async function fetchEdirProfileAPI( name, last_name, gender, date_of_birth, country, city){
    const response = await fetch("http://localhost/friend-finder/Controllers/api/edit_profile.php",{
    method: 'POST',
    body: new URLSearchParams({
        "name": name,
        "last_name": last_name,
        "gender": gender,
        "date_of_birth": date_of_birth,
        "country": country,
        "city": city
    })
  });
  if(!response.ok){
    const message = "ERROR OCCURED";
    throw new Error(message);
  }
  
  const success = await response.json();
  return success;
  }

function saveInfo(){
    let gender = ''
    let first_name = $('#firstname').val()
    let last_name = $('#lastname').val()
    let birthdate = $('#birthdate').val()
    // let checkmale = $('#male')
    // let checkfemale = $('#female')
    let city = $('#city').val()
    let country = $('#country').val()
    if($('#male').is(':checked')){
        gender = 'Male'
    }else{
        gender = 'Female'
    }

    fetchEdirProfileAPI( first_name, last_name, gender, birthdate, country, city)


}
  